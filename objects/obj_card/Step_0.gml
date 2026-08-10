if (global.pausado) exit;

if (instance_exists(instancia_arrastando)) {
    if (!instancia_arrastando.sendo_arrastada) {
        instancia_arrastando = noone;
    }
} else {
    instancia_arrastando = noone;
}

suficiente = (obj_controller.engrenagens_estoque >= custo);

mouse_sobre = position_meeting(mouse_x, mouse_y, id);

var escala_alvo = mouse_sobre ? escala_hover : escala_base;
escala_atual = lerp(escala_atual, escala_alvo, velocidade_lerp);

image_xscale = escala_atual;
image_yscale = escala_atual;

if (suficiente && mouse_sobre) {
    if (mouse_check_button_pressed(mb_left) && instancia_arrastando == noone) {
        tremor_forca = 8;
        
        var nova_inst = instance_create_layer(mouse_x, mouse_y, "Instances", objeto_para_criar);
        with (nova_inst) {
            sendo_arrastada = true;
            estava_no_mapa = false;
            custo_compra = other.custo;
        }
        
        instancia_arrastando = nova_inst;
    }
}

if (tremor_forca > 0.1) {
    offset_shake_x = random_range(-tremor_forca, tremor_forca);
    offset_shake_y = random_range(-tremor_forca, tremor_forca);
    tremor_forca *= tremor_decaimento;
} else {
    tremor_forca = 0;
    offset_shake_x = 0;
    offset_shake_y = 0;
}