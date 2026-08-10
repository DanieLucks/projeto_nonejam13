// ----------------------------------------------------
// 1. INICIALIZAÇÃO DE UMA ENGRENAGEM
// ----------------------------------------------------
function scr_inicializar_engrenagem() {
    if (durabilidade_maxima_frames == 0) {
        var durabilidade_segundos = random_range(durabilidade_min, durabilidade_max);
        durabilidade_maxima_frames = durabilidade_segundos * game_get_speed(gamespeed_fps);
        durabilidade_atual = durabilidade_maxima_frames;
    }

    if (instance_exists(engrenagem_pai)) {
        sentido_rotacao = -engrenagem_pai.sentido_rotacao;
        velocidade_rotacao = global.velocidade_global_engrenagem; 
    }
}

// ----------------------------------------------------
// 2. CÁLCULO DE SENTIDO TEÓRICO
// ----------------------------------------------------
function scr_calcular_sentido_teorico(inst_pai) {
    if (!instance_exists(inst_pai)) return 1;
    return -inst_pai.sentido_rotacao;
}

// ----------------------------------------------------
// 3. VALIDAÇÃO DE ENCAIXE NO GRID
// ----------------------------------------------------
function scr_validar_posicao_encaixe(x_pos, y_pos, inst_pai_candidato) {
    if (!instance_exists(inst_pai_candidato)) return false;

    if (x_pos < 160) return false;

    var eh_eu_automato = (object_index == par_automato || object_is_ancestor(object_index, par_automato));
    if (eh_eu_automato && inst_pai_candidato.object_index == obj_nucleo) {
        return false;
    }

    if (inst_pai_candidato.object_index == obj_nucleo) {
        var tamanho_grid = 32;
        var x_saida_direita = inst_pai_candidato.x + tamanho_grid;
        var y_saida_direta = inst_pai_candidato.y;
        
        if (abs(x_pos - x_saida_direita) > 2 || abs(y_pos - y_saida_direta) > 2) {
            return false;
        }
    }

    if (instance_exists(obj_nucleo)) {
        var tamanho_grid = 32;
        var centro_y = obj_nucleo.y;
        var y_minimo = centro_y - (3 * tamanho_grid);
        var y_maximo = centro_y + (3 * tamanho_grid);

        if (y_pos < y_minimo || y_pos > y_maximo) return false;
    }

    if (object_is_ancestor(inst_pai_candidato.object_index, par_automato) || inst_pai_candidato.object_index == par_automato) {
        return false;
    }

    if (scr_eh_descendente(inst_pai_candidato, id)) return false;

    var ocupante = instance_position(x_pos, y_pos, par_engrenagem);
    if (instance_exists(ocupante)) {
        if (ocupante != id && !ocupante.esta_quebrada) {
            return false;
        }
    }

    var meu_sentido_teorico = scr_calcular_sentido_teorico(inst_pai_candidato);

    with (par_engrenagem) {
        if (id != other.id && id != inst_pai_candidato && !sendo_arrastada && !esta_quebrada) {
            var dist = point_distance(x_pos, y_pos, x, y);
            if (dist <= 36 && tem_energia) {
                if (sentido_rotacao == meu_sentido_teorico) {
                    return false;
                }
            }
        }
    }
    return true;
}

// ----------------------------------------------------
// 4. SOLTAR ENGRENAGEM
// ----------------------------------------------------
function scr_soltar_engrenagem() {
    if (!sendo_arrastada) exit;
    
    sendo_arrastada = false;

    if (instance_exists(pai_candidato) && posicao_valida) {
        engrenagem_pai = pai_candidato;
        
        var tamanho_grid = 32; 
        x = round(x_ancora / tamanho_grid) * tamanho_grid;
        y = round(y_ancora / tamanho_grid) * tamanho_grid;
        
        if (!estava_no_mapa) {
            if (variable_instance_exists(id, "custo_compra")) {
                obj_controller.engrenagens_estoque -= custo_compra;
            }
            estava_no_mapa = true;
        }
        
        scr_inicializar_engrenagem();
        scr_recalcular_cadeia();
    } 
    else {
        if (estava_no_mapa) {
            x = x_original;
            y = y_original;
            engrenagem_pai = engrenagem_pai_original;
            
            if (instance_exists(engrenagem_pai)) {
                scr_inicializar_engrenagem();
            }
            scr_recalcular_cadeia();
        } else {
            instance_destroy();
        }
    }
}

// ----------------------------------------------------
// 5. PROCESSAMENTO DO DESGASTE E ENERGIA
// ----------------------------------------------------
function scr_processar_engrenagem() {
    if (instance_exists(engrenagem_pai)) {
        if (engrenagem_pai.object_index == obj_nucleo) {
            tem_energia = engrenagem_pai.tem_energia;
        } else {
            tem_energia = (engrenagem_pai.tem_energia && !engrenagem_pai.esta_quebrada);
        }
    } else {
        tem_energia = false;
    }

    if (tem_energia && !esta_quebrada) {
        rot_parado = -1;
        
        sentido_rotacao = -engrenagem_pai.sentido_rotacao;
        velocidade_rotacao = global.velocidade_global_engrenagem;
        
        durabilidade_atual -= (0.2 + velocidade_rotacao * 0.005);

        if (durabilidade_atual <= 0) {
            esta_quebrada = true;
            tem_energia = false;
            image_blend = c_dkgray;
            
            rot_parado = (global.angulo_base_engrenagem * sentido_rotacao) % 360;
            
            var old_x = x;
            var old_y = y;
            x = -9999;
            y = -9999;
            
            scr_recalcular_cadeia();
            
            x = old_x;
            y = old_y;
        }
    } else {
        if (rot_parado == -1) {
            var num_dentes = 8; 
            var paso_dente = 360 / num_dentes;
            var offset_fase = ((round(x/32) + round(y/32)) mod 2 == 0) ? 0 : (paso_dente / 2);
    
            rot_parado = ((global.angulo_base_engrenagem * sentido_rotacao) + offset_fase) % 360;
        }
    }
}

// ----------------------------------------------------
// 6. RECÁLCULO SEGURO E PROPAGAÇÃO DA CADEIA (BFS)
// ----------------------------------------------------
function scr_recalcular_cadeia() {
    with (par_engrenagem) {
        if (!sendo_arrastada && !esta_quebrada) {
            tem_energia = false;
            engrenagem_pai = noone;
            velocidade_rotacao = 0;
            alinhado_com_pai = false;
        }
    }
    
    if (!instance_exists(obj_nucleo)) exit;
    
    var fila = ds_queue_create();
    var tamanho_grid = 32;
    
    var x_saida_nucleo = obj_nucleo.x + tamanho_grid;
    var y_saida_nucleo = obj_nucleo.y;
    
    with (par_engrenagem) {
        if (!sendo_arrastada && !esta_quebrada) {
            if (abs(x - x_saida_nucleo) <= 2 && abs(y - y_saida_nucleo) <= 2) {
                tem_energia = obj_nucleo.tem_energia;
                engrenagem_pai = obj_nucleo;
                sentido_rotacao = -obj_nucleo.sentido_rotacao;
                velocidade_rotacao = global.velocidade_global_engrenagem;
                
                ds_queue_enqueue(fila, id);
            }
        }
    }

    while (!ds_queue_empty(fila)) {
        var atual = ds_queue_dequeue(fila);
        
        var ax = atual.x;
        var ay = atual.y;
        var asentido = atual.sentido_rotacao;
        
        with (par_engrenagem) {
            if (!tem_energia && !esta_quebrada && !sendo_arrastada) {
                var dist = point_distance(x, y, ax, ay);
                
                if (dist >= 28 && dist <= 36) {
                    tem_energia = true;
                    engrenagem_pai = atual;
                    sentido_rotacao = -asentido;
                    velocidade_rotacao = global.velocidade_global_engrenagem;
                    
                    if (!alinhado_com_pai) {
                        var angulo_entre = point_direction(ax, ay, x, y);
                        rot = (angulo_entre + 15) % 360;
                        alinhado_com_pai = true;
                    }
                    
                    var eh_automato = (object_index == par_automato || object_is_ancestor(object_index, par_automato));
                    if (!eh_automato) {
                        ds_queue_enqueue(fila, id);
                    }
                }
            }
        }
    }
    
    ds_queue_destroy(fila);
}

// ----------------------------------------------------
// 7. VERIFICAÇÃO DE ANCESTRALIDADE / DESCENDÊNCIA
// ----------------------------------------------------
function scr_eh_descendente(inst_procurada, inst_atual) {
    if (!instance_exists(inst_atual) || !instance_exists(inst_procurada)) return false;
    
    var id_atual = inst_atual.id;
    var encontrou = false;
    
    with (par_engrenagem) {
        if (engrenagem_pai == id_atual && !esta_quebrada) {
            if (id == inst_procurada.id) {
                encontrou = true;
            } else if (scr_eh_descendente(inst_procurada, id)) {
                encontrou = true;
            }
        }
    }
    
    return encontrou;
}

// ----------------------------------------------------
// 8. RECONEXÃO DE ENGRENAGENS ÓRFÃS
// ----------------------------------------------------
function scr_reconectar_orfas() {
    scr_recalcular_cadeia();
}