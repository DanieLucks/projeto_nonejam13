event_inherited();

image_xscale = 1.5
image_yscale = 1.5

depth = y * -1

tempo_producao_base = 12 * game_get_speed(gamespeed_fps); // Produz a cada 12 segundos (base)
timer_producao = tempo_producao_base;

sprite_topo = spr_fabrica;