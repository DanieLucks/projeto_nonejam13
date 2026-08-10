if (global.pausado) exit;

var mx = mouse_x;
var my = mouse_y;

mouse_sobre = position_meeting(mx, my, id);

var escala_alvo = mouse_sobre ? escala_hover : escala_base;
escala_atual = lerp(escala_atual, escala_alvo, velocidade_lerp);

image_xscale = escala_atual;
image_yscale = escala_atual;

if (mouse_check_button_pressed(mb_left) && mouse_sobre && !arrastando) {
    arrastando = true;
    depth = -999;
}

if (arrastando) {
    var maquina_alvo = instance_position(mx, my, par_automato);
    
    if (mouse_check_button_released(mb_left)) {
        arrastando = false;
        
        if (instance_exists(maquina_alvo)) {
            var custo_orig = variable_instance_exists(maquina_alvo, "custo") ? maquina_alvo.custo : 0;
            var valor_devolucao = floor(custo_orig * taxa_reembolso);
            
            if (instance_exists(obj_controller) && valor_devolucao > 0) {
                obj_controller.engrenagens_estoque += valor_devolucao;
            }
            
            var qtd_particulas = 5;
            for (var i = 0; i < qtd_particulas; i++) {
                var p = instance_create_layer(maquina_alvo.x, maquina_alvo.y, "Instances", obj_drop_particula);
                p.direcao_x = random_range(-2.5, 2.5);
            }
            
            instance_destroy(maquina_alvo);
        }
    }
}