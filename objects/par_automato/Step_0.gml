if (global.pausado) exit;

event_inherited();

if (sendo_arrastada) {
    depth = -9999;
} else {
    depth = -y - 16;
}

durabilidade_atual = durabilidade_maxima_frames; 


if (pifado) {
    image_blend = c_red;
    

    timer_conserto -= 1;
    
    if (timer_conserto <= 0) {
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

else if (!sendo_arrastada && tem_energia && estava_no_mapa) {
    image_blend = c_white;
    
    tempo_para_pifar -= 1;
    
    if (tempo_para_pifar <= 0) {
        pifado = true;

        timer_conserto = 7 * game_get_speed(gamespeed_fps); 
    }
}