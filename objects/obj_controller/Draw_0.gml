// Titulo: Indicador Estilizado de Ondas (HUD Superior Direito)
var hud_x = room_width - 60;
var hud_y = 20;

// 1. TEXTO DE CABEÇALHO ("ONDA")
draw_set_font(fnt_base); // Substitua por font_hud se tiver uma fonte no projeto
draw_set_halign(fa_center);
draw_set_valign(fa_top);


// Texto "ONDA" principal
draw_set_color(c_gray);
draw_text(hud_x - 5, hud_y, "ONDA ATUAL");

// 2. NÚMERO DA ONDA ATUAL (DESTAQUE GRANDE)
var texto_onda = string(onda_atual);
var pos_y_numero = hud_y + 18;

// Sombra projetada do número
draw_set_color(c_black);
draw_text_transformed(hud_x + 2, pos_y_numero + 2, texto_onda, 2, 2, 0);

// Cor do número (Laranja em preparação / Vermelho/Amarelo durante a horda)
var cor_numero = esperando_proxima_onda ? c_orange : c_yellow;
draw_set_color(cor_numero);
draw_text_transformed(hud_x - 10, pos_y_numero, texto_onda, 2, 2, 0);

var pos_y_status = pos_y_numero + 36;

if (esperando_proxima_onda) {

    var alpha_aviso = 0.6 + sin(current_time * 0.01) * 0.4;
    
    draw_set_color(c_orange);
    draw_set_alpha(alpha_aviso);
    draw_text(hud_x -3, pos_y_status, "CHEGANDO!");
    draw_set_alpha(1.0);
} else {
    var progresso_str = string(inimigos_gerados_onda) + " / " + string(inimigos_por_onda);
    
    draw_set_color(c_red);
    draw_text(hud_x -3, pos_y_status, "SOB ATAQUE!");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);