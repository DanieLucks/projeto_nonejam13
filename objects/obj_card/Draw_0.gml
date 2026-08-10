var rx = x + offset_shake_x;
var ry = y + offset_shake_y;

var cor_card = suficiente ? c_white : c_dkgray;
var alfa_card = suficiente ? 1.0 : 0.6;

draw_sprite_ext(
    sprite_index, 
    image_index, 
    rx, 
    ry, 
    image_xscale, 
    image_yscale, 
    0, 
    cor_card, 
    alfa_card
);

if (sprite_exists(sprite_item)) {
    draw_sprite_ext(
        sprite_item, 
        image_index, 
        rx, 
        ry - 5, 
        image_xscale, 
        image_yscale, 
        0, 
        cor_card, 
        alfa_card
    );
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_base);
draw_set_color(suficiente ? c_yellow : c_red);

var pos_y_texto = ry + (23 * image_yscale);

draw_text_transformed(
    rx, 
    pos_y_texto, 
    string(custo), 
    image_xscale, 
    image_yscale, 
    0
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (position_meeting(mouse_x, mouse_y, id) && !global.pausado) {
    var texto = descricao;
    var largura_maxima = 160;
    var padding = 8;
    
    var largura_caixa = min(string_width(texto), largura_maxima);
    var altura_texto = string_height_ext(texto, -1, largura_maxima);
    
    var c_x1 = rx - (largura_caixa / 2) - padding;
    var c_y1 = bbox_bottom + 8;
    var c_x2 = rx + (largura_caixa / 2) + padding;
    var c_y2 = c_y1 + altura_texto + (padding * 2);
    
    if (c_y2 > room_height) {
        c_y1 = bbox_top - altura_texto - (padding * 2) - 8;
        c_y2 = bbox_top - 8;
    }

    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(c_x1, c_y1, c_x2, c_y2, false);
    
    draw_set_color(c_orange);
    draw_set_alpha(1.0);
    draw_rectangle(c_x1, c_y1, c_x2, c_y2, true);
    
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    draw_text_ext(rx, c_y1 + padding, texto, -1, largura_maxima);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1.0);
}