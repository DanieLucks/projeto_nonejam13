event_inherited(); 

durabilidade_atual = durabilidade_maxima_frames; 

if (pifado) {
    timer_conserto -= 1;
    image_blend = c_red;
    

    if (timer_conserto <= 0) {
        var raio_explosao = 32;
        effect_create_above(ef_explosion, x, y, 1.5, c_red);
        
        var lista_atingidos = ds_list_create();
        var total_atingidos = collision_circle_list(x, y, raio_explosao, par_engrenagem, false, true, lista_atingidos, false);
        
        for (var i = 0; i < total_atingidos; i++) {
            var inst = lista_atingidos[| i];
            if (instance_exists(inst)) {
                effect_create_above(ef_smoke, inst.x, inst.y, 0.5, c_gray);
                with (inst) instance_destroy();
            }
        }
        ds_list_destroy(lista_atingidos);
        
        instance_destroy();

        scr_recalcular_cadeia();
    }
} 

else if (!sendo_arrastada && tem_energia && !esta_quebrada) {
    image_blend = c_white;
    
    tempo_para_pifar -= 1;
    if (tempo_para_pifar <= 0) {
        pifado = true;
        timer_conserto = 7 * game_get_speed(gamespeed_fps); // Inicia os 7s de perigo
    }
}