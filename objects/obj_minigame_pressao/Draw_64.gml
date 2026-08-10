if (!instance_exists(automato_alvo)) exit;

var centro_x = display_get_gui_width() / 2;
var centro_y = display_get_gui_height() / 2;
var raio = 100;

// 1. FUNDO ESCURECIDO
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);

// 2. CORPO DO RELÓGIO (Muda para VERDE quando o ponteiro está na faixa certa)
var dentro_da_zona = (pressao_angulo <= alvo_min_angulo && pressao_angulo >= alvo_max_angulo);
var cor_borda = dentro_da_zona ? c_lime : c_silver;

draw_set_color(c_dkgray);
draw_circle(centro_x, centro_y, raio + 10, false);
draw_set_color(cor_borda);
draw_circle(centro_x, centro_y, raio, false);
draw_set_color(c_white);
draw_circle(centro_x, centro_y, raio - 5, false);

// 3. DESENHO DA ZONA VERDE
draw_set_color(c_lime);
for (var a = alvo_max_angulo; a <= alvo_min_angulo; a += 1) {
    var px1 = centro_x + lengthdir_x(raio - 25, a);
    var py1 = centro_y + lengthdir_y(raio - 25, a);
    var px2 = centro_x + lengthdir_x(raio - 5, a);
    var py2 = centro_y + lengthdir_y(raio - 5, a);
    draw_line_width(px1, py1, px2, py2, 2);
}

// 4. DESENHO DO PONTEIRO
var p_x = centro_x + lengthdir_x(raio - 15, pressao_angulo);
var p_y = centro_y + lengthdir_y(raio - 15, pressao_angulo);

draw_set_color(c_red);
draw_line_width(centro_x, centro_y, p_x, p_y, 4);
draw_set_color(c_black);
draw_circle(centro_x, centro_y, 8, false);

// 5. BARRA DO TIMER DE 7 SEGUNDOS DO AUTÔMATO
var tempo_total_frames = 7 * game_get_speed(gamespeed_fps);
var pct_tempo = (automato_alvo.timer_conserto / tempo_total_frames) * 100;

// Exibe a barra de contagem regressiva (Esfria até zerar)
draw_healthbar(centro_x - 80, centro_y + raio + 20, centro_x + 80, centro_y + raio + 32, pct_tempo, c_black, c_red, c_orange, 0, true, true);

// 6. INSTRUÇÕES
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(centro_x, centro_y - raio - 30, "MANTENHA EQUILIBRADO ATÉ O TEMPO ACABAR!");
draw_text(centro_x, centro_y + raio + 40, "[A / D] para Equilibrar Pressão | [ESC] Fechar Painel");
draw_set_halign(fa_left);