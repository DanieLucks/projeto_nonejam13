event_inherited();

if (pifado && !sendo_arrastada) {
    var segundos_restantes = ceil(timer_conserto / game_get_speed(gamespeed_fps));
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    
    draw_set_color(c_red);
    draw_text(x, y - raio - 10, "PERIGO: " + string(segundos_restantes) + "s");
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}