if (global.pausado) exit;

if (sendo_arrastada) {
    var tamanho_grid = 32;
    x = mouse_x;
    y = mouse_y;
    depth = -9999;
    
    pai_candidato = noone;
    posicao_valida = false;
    
    var menor_distancia_mouse_slot = 9999;
    var raio_busca = 80; 
    
    var mx = mouse_x;
    var my = mouse_y;
    var meu_id = id;
    
    if (instance_exists(obj_nucleo)) {
        with (obj_nucleo) {
            var cx = x + tamanho_grid;
            var cy = y;
            
            var dist_slot = point_distance(mx, my, cx, cy);
            var dist_centro_nucleo = point_distance(mx, my, x, y);
            
            if (dist_centro_nucleo <= raio_busca + raio) {
                if (dist_slot < menor_distancia_mouse_slot) {
                    with (meu_id) {
                        if (scr_validar_posicao_encaixe(cx, cy, other.id)) {
                            pai_candidato = other.id;
                            x_ancora = cx;
                            other.x_ancora = cx;
                            y_ancora = cy;
                            other.y_ancora = cy;
                            menor_distancia_mouse_slot = dist_slot;
                        }
                    }
                }
            }
        }
    }
    
    with (par_engrenagem) {
        var eh_automato = (object_index == par_automato || object_is_ancestor(object_index, par_automato));
        
        if (id != meu_id && !esta_quebrada && tem_energia && !eh_automato) {
            var eh_desc = false;
            with (meu_id) {
                if (scr_eh_descendente(other.id, id)) eh_desc = true;
            }
            
            if (!eh_desc) {
                var dist_mouse_centro = point_distance(mx, my, x, y);
                
                if (dist_mouse_centro <= raio_busca) {
                    var slots_x = [x + tamanho_grid, x - tamanho_grid, x, x];
                    var slots_y = [y, y, y + tamanho_grid, y - tamanho_grid];
                    
                    for (var i = 0; i < 4; i++) {
                        var cx = slots_x[i];
                        var cy = slots_y[i];
                        
                        var dist_slot = point_distance(mx, my, cx, cy);
                        
                        if (dist_slot < menor_distancia_mouse_slot) {
                            with (meu_id) {
                                if (scr_validar_posicao_encaixe(cx, cy, other.id)) {
                                    pai_candidato = other.id;
                                    x_ancora = cx;
                                    y_ancora = cy;
                                    menor_distancia_mouse_slot = dist_slot;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    posicao_valida = (instance_exists(pai_candidato));
} 
else {
    scr_processar_engrenagem();
    
    if (tem_energia && !esta_quebrada) {
        if (!alinhado_com_pai && instance_exists(engrenagem_pai)) {
            var dir_pai = point_direction(engrenagem_pai.x, engrenagem_pai.y, x, y);
            rot = (engrenagem_pai.rot + 180 + 15) % 360; 
            alinhado_com_pai = true;
        }

        velocidade_rotacao = global.velocidade_global_engrenagem;
        
        rot += velocidade_rotacao * sentido_rotacao;
        rot = (rot + 360) % 360;
    } else {
        alinhado_com_pai = false;
    }
    
    depth = -y - 1;
}