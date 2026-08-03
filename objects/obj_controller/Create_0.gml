engrenagens_estoque = 0
pontuacao = 0;
vida_nucleo = 5;

var centro_y = 352;
var espacamento = 32;
var total_lanes = 9;

lanes_y = array_create(total_lanes);

var y_inicial = centro_y - ((total_lanes - 1) / 2) * espacamento;

for (var i = 0; i < total_lanes; i++) {
    lanes_y[i] = y_inicial + (i * espacamento);
}


tempo_spawn_max = 8 * game_get_speed(gamespeed_fps); 
timer_spawn = tempo_spawn_max;

