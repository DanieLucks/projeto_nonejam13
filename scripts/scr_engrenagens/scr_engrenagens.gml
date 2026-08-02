function scr_inicializar_engrenagem() {
    var durabilidade_segundos = random_range(durabilidade_min, durabilidade_max);
    durabilidade_maxima_frames = durabilidade_segundos * game_get_speed(gamespeed_fps);
    durabilidade_atual = durabilidade_maxima_frames;

    if (instance_exists(engrenagem_pai)) {
        sentido_rotacao = -engrenagem_pai.sentido_rotacao;
        var vel_pai = (engrenagem_pai.object_index == obj_nucleo) ? engrenagem_pai.velocidade_base : engrenagem_pai.velocidade_rotacao;
        velocidade_rotacao = vel_pai * (engrenagem_pai.raio / raio);
    }
}

function scr_contar_descendentes() {
    var total = 0;
    var meu_id = id;
    
    with (par_engrenagem) {
        if (engrenagem_pai == meu_id && !esta_quebrada) {
            total += 1 + scr_contar_descendentes(); 
        }
    }
    return total;
}

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
        sentido_rotacao = -engrenagem_pai.sentido_rotacao;
        
        var vel_pai = (engrenagem_pai.object_index == obj_nucleo) ? engrenagem_pai.velocidade_base : engrenagem_pai.velocidade_rotacao;
        velocidade_rotacao = vel_pai * (engrenagem_pai.raio / raio);
        
        image_angle -= (velocidade_rotacao * sentido_rotacao);
        
        var descendentes = scr_contar_descendentes();
        desgaste_multiplicador = 1 + (descendentes * 0.5);
        durabilidade_atual -= (1 * desgaste_multiplicador);
        
        if (durabilidade_atual <= 0) {
            esta_quebrada = true;
            tem_energia = false;
            image_blend = c_dkgray;
            scr_recalcular_cadeia();
        }
    }
}

function scr_calcular_sentido_teorico(inst_pai) {
    if (!instance_exists(inst_pai)) return 1;
    return -inst_pai.sentido_rotacao;
}

function scr_validar_posicao_encaixe(x_pos, y_pos, inst_pai_candidato) {
    if (!instance_exists(inst_pai_candidato)) return false;
    
    if (scr_eh_descendente(inst_pai_candidato, id)) {
        return false;
    }
    
    var meu_sentido_teorico = scr_calcular_sentido_teorico(inst_pai_candidato);
    
    with (par_engrenagem) {
        if (id != other.id && id != inst_pai_candidato && !sendo_arrastada) {
            var dist = point_distance(x_pos, y_pos, x, y);
            var soma_raios = other.raio + raio;
            
            if (dist < soma_raios * 0.8) {
                return false;
            }
            
            if (dist <= soma_raios + 4 && !esta_quebrada && tem_energia) {
                if (sentido_rotacao == meu_sentido_teorico) {
                    return false;
                }
            }
        }
    }
    return true;
}

function scr_soltar_engrenagem() {
    if (!sendo_arrastada) exit;
    
    sendo_arrastada = false;
    
    if (instance_exists(pai_candidato) && posicao_valida) {
        engrenagem_pai = pai_candidato;
        x = x_ancora;
        y = y_ancora;
        
        scr_inicializar_engrenagem();

        var meu_id = id;
        with (par_engrenagem) {
            if (id != meu_id && !esta_quebrada && !sendo_arrastada) {
          
                if (!instance_exists(engrenagem_pai) || engrenagem_pai.esta_quebrada || engrenagem_pai == noone) {
                    var dist = point_distance(x, y, other.x, other.y);
                    var soma_raios = raio + other.raio;
                    
                    if (dist <= soma_raios + 2) {
                        engrenagem_pai = meu_id;
                    }
                }
            }
        }
        
        scr_recalcular_cadeia();
    } else {
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

function scr_recalcular_cadeia() {
    var mudou_algo = false;
    
    with (par_engrenagem) {
        if (!esta_quebrada) {
            var pai_valido_e_ativo = false;
            
            if (instance_exists(engrenagem_pai)) {
                if (engrenagem_pai.object_index == obj_nucleo) {
                    pai_valido_e_ativo = engrenagem_pai.tem_energia;
                } else {
                    pai_valido_e_ativo = (engrenagem_pai.tem_energia && !engrenagem_pai.esta_quebrada && !engrenagem_pai.sendo_arrastada);
                }
            } else {
                tem_energia = false;
            }
            
            if (tem_energia != pai_valido_e_ativo) {
                tem_energia = pai_valido_e_ativo;
                if (tem_energia && instance_exists(engrenagem_pai)) {
                    sentido_rotacao = -engrenagem_pai.sentido_rotacao;
                }
                mudou_algo = true;
            }
        }
    }
    
    if (mudou_algo) {
        scr_recalcular_cadeia();
    }
}

function scr_eh_descendente(inst_procurada, inst_atual) {
    if (!instance_exists(inst_atual) || !instance_exists(inst_procurada)) return false;
    
    var eh_filho = false;
    var id_atual = inst_atual.id;
    
    with (par_engrenagem) {
        if (engrenagem_pai == id_atual) {
            if (id == inst_procurada.id) {
                return true;
            }
            if (scr_eh_descendente(inst_procurada, id)) {
                return true;
            }
        }
    }
    
    return false;
}