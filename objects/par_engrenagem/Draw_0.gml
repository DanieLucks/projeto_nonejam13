if (!esta_quebrada && tem_energia) {
    var pct = (durabilidade_atual / durabilidade_maxima_frames) * 100;
    
    var cor = c_green;
    if (pct < 50) cor = c_yellow;
    if (pct < 20) cor = c_red;
    
    draw_healthbar(x - 16, y - raio - 10, x + 16, y - raio - 6, pct, c_black, cor, cor, 0, true, true);
}

if (sendo_arrastada) {
    if (instance_exists(pai_candidato)) {

        var cor_previa = posicao_valida ? c_lime : c_red;
        

        draw_sprite_ext(sprite_index, image_index, x_ancora, y_ancora, image_xscale, image_yscale, 0, cor_previa, 0.6);
        

        draw_line_color(pai_candidato.x, pai_candidato.y, x_ancora, y_ancora, cor_previa, cor_previa);
    }
    

    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.8);
} else {

    draw_self();

    if (!esta_quebrada && tem_energia) {
        var pct = (durabilidade_atual / durabilidade_maxima_frames) * 100;
        var cor = c_green;
        if (pct < 50) cor = c_yellow;
        if (pct < 20) cor = c_red;
        
        draw_healthbar(x - 16, y - raio - 10, x + 16, y - raio - 6, pct, c_black, cor, cor, 0, true, true);
    }
}