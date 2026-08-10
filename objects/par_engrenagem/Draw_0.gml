var num_dentes = 8; 
var passo_dente = 360 / num_dentes; 

var celula_x = round(x / 32);
var celula_y = round(y / 32);

var offset_fase = ((celula_x + celula_y) mod 2 == 0) ? 0 : (passo_dente / 2);

if (sendo_arrastada) {
    if (instance_exists(pai_candidato)) {
        var cor_previa = posicao_valida ? c_lime : c_red;
        draw_line_width_color(pai_candidato.x, pai_candidato.y, x_ancora, y_ancora, 2, cor_previa, cor_previa);
        draw_sprite_ext(sprite_index, image_index, x_ancora, y_ancora, image_xscale, image_yscale, 0, cor_previa, 0.5);
    }
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.8);
} 
else {
    var angulo_desenho = 0;
    
    if (tem_energia && !esta_quebrada) {
        angulo_desenho = ((global.angulo_base_engrenagem * sentido_rotacao) + offset_fase) % 360;
    } else {
        angulo_desenho = rot_parado;
    }
    
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angulo_desenho, image_blend, image_alpha);
}