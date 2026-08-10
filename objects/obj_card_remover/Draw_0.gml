draw_self();

var mx = mouse_x;
var my = mouse_y;

if (arrastando) {
    var maquina_alvo = instance_position(mx, my, par_automato);
    
    if (instance_exists(maquina_alvo)) {
        var alpha_brilho = 0.5 + sin(current_time * 0.01) * 0.25;
        
        with (maquina_alvo) {
            draw_sprite_ext(
                sprite_index, 
                image_index, 
                x, 
                y, 
                image_xscale * 1.05, 
                image_yscale * 1.05, 
                image_angle, 
                c_orange, 
                alpha_brilho
            );
        }
    }
    
    draw_sprite_ext(sprite_index, 0, mx, my, 1.2, 1.2, 0, c_white, 0.85);
}

if (mouse_sobre && !arrastando && !global.pausado) {
    draw_set_font(-1);
    
    var texto = descricao;
    var largura_maxima = 170;
    var padding = 8;
    
    var largura_caixa = min(string_width(texto), largura_maxima);
    var altura_texto = string_height_ext(texto, -1, largura_maxima);
    
    var c_x1 = x - (largura_caixa / 2) - padding;
    var c_y1 = bbox_bottom + 8;
    var c_x2 = x + (largura_caixa / 2) + padding;
    var c_y2 = c_y1 + altura_texto + (padding * 2);
    
    if (c_y2 > room_height) {
        c_y1 = bbox_top - altura_texto - (padding * 2) - 8;
        c_y2 = bbox_top - 8;
    }

    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(c_x1, c_y1, c_x2, c_y2, false);
    
    draw_set_color(c_red);
    draw_set_alpha(1.0);
    draw_rectangle(c_x1, c_y1, c_x2, c_y2, true);
    
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    draw_text_ext(x, c_y1 + padding, texto, -1, largura_maxima);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1.0);
}