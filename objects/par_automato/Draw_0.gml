if (sendo_arrastada) {
    if (instance_exists(pai_candidato)) {
        var cor_previa = posicao_valida ? c_lime : c_red;


        draw_line_width_color(pai_candidato.x, pai_candidato.y, x_ancora, y_ancora, 2, cor_previa, cor_previa);

        draw_sprite_ext(sprite_index, image_index, x_ancora, y_ancora, image_xscale, image_yscale, 0, cor_previa, 0.5);
    }
    
    if (variable_instance_exists(id, "sprite_topo") && sprite_exists(sprite_topo)) {
        draw_sprite_ext(sprite_topo, 0, x, y, image_xscale * .8, image_yscale * .8, 0, c_white, 0.8);
    } else {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.8);
    }
} 
else {
 
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, rot, image_blend, image_alpha);

    if (pifado) {
        var segundos_restantes = ceil(timer_conserto / game_get_speed(gamespeed_fps));
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_set_color(c_red);
        draw_text(x, y - raio - 10, "PERIGO: " + string(segundos_restantes) + "s");
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}