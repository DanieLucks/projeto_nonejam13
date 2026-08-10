if (!instance_exists(automato_alvo)) {
    instance_destroy();
    exit;
}

if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    velocidade_pressao += aceleracao;
}
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    velocidade_pressao -= aceleracao;
}

velocidade_pressao += gravidade_vazamento;
velocidade_pressao *= friccao;
pressao_angulo += velocidade_pressao;

if (pressao_angulo > 210) {
    pressao_angulo = 210;
    velocidade_pressao = -velocidade_pressao * 0.3;
}
if (pressao_angulo < -30) {
    pressao_angulo = -30;
    velocidade_pressao = -velocidade_pressao * 0.3;
}

dentro_da_zona = (pressao_angulo <= alvo_min_angulo && pressao_angulo >= alvo_max_angulo);

automato_alvo.timer_conserto -= 1;

if (automato_alvo.timer_conserto <= 0) {
    if (dentro_da_zona) {
        with (automato_alvo) {
            pifado = false;
            image_blend = c_white;
            tempo_para_pifar = random_range(60, 120) * game_get_speed(gamespeed_fps);
            
            for (var i = 0; i < 4; i++) {
                effect_create_above(ef_smoke, x + random_range(-16, 16), y + random_range(-16, 16), 0.4, c_orange);
            }
        }
    } else {
        with (automato_alvo) {
            var raio_explosao = 48;
            effect_create_above(ef_explosion, x, y, 1.0, c_orange);
            
            var lista_atingidos = ds_list_create();
            var total_atingidos = collision_circle_list(x, y, raio_explosao, par_engrenagem, false, true, lista_atingidos, false);
            
            for (var i = 0; i < total_atingidos; i++) {
                var inst = lista_atingidos[| i];
                if (instance_exists(inst) && inst != id) {
                    effect_create_above(ef_smoke, inst.x, inst.y, 0.5, c_gray);
                    with (inst) instance_destroy();
                }
            }
            ds_list_destroy(lista_atingidos);
            
            x = -9999;
            y = -9999;
            
            scr_recalcular_cadeia();
            instance_destroy();
        }
    }
    
    instance_destroy();
}

if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
}