if (global.pausado) exit;


var vel_final = velocidade;

if (esta_desacelerado) {
    vel_final = velocidade * fator_desaceleracao;
    timer_desacelerado -= 1;
    

    image_blend = c_aqua;
    
    if (timer_desacelerado <= 0) {
        esta_desacelerado = false;
        image_blend = c_white;
    }
}

x -= vel_final;
depth = -y;

var mult_ritmo = esta_desacelerado ? fator_desaceleracao : 1.0;
tempo_passo += velocidade_passo * mult_ritmo;
offset_passo_x = sin(tempo_passo) * amplitude_avanco; 
image_angle = sin(tempo_passo) * amplitude_inclinacao;

if (hit_timer > 0) {
    hit_timer -= 1;
    image_blend = c_red;
} else if (!esta_desacelerado) {
    image_blend = c_white;
}

if (x < 64) {
    if (instance_exists(obj_controller)) {
        obj_controller.vida_nucleo -= dano_ao_nucleo;
    }
    effect_create_above(ef_smoke, x, y, 0.5, c_dkgray);
    instance_destroy();
}

if vida <= 0 instance_destroy()