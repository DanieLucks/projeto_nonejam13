event_inherited();

sprite_topo = spr_explosivo;
custo = 60
raio_explosao = 64;
armada = false;
tempo_armar = 10 * game_get_speed(gamespeed_fps);
timer_armar = tempo_armar;

sendo_arrastada = true;
pai_candidato = noone;
posicao_valida = false;
estava_no_mapa = false;