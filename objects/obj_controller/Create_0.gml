
global.pausado = false;
global.angulo_base_engrenagem = 0;
global.velocidade_global_engrenagem = 2;

engrenagens_estoque = 20;
pontuacao = 0;
vida_nucleo = 5;

var centro_y = 352;
var espacamento = 32;
var total_lanes = 7;

lanes_y = array_create(total_lanes);
var y_inicial = centro_y - ((total_lanes - 1) / 2) * espacamento;

for (var i = 0; i < total_lanes; i++) {
    lanes_y[i] = y_inicial + (i * espacamento);
}

var max_lanes = array_length(lanes_y);
var centro_idx = floor(max_lanes / 2);
lanes_ativas_indices = [centro_idx - 1, centro_idx, centro_idx + 1];


onda_atual = 1;
inimigos_gerados_onda = 0;
inimigos_por_onda = 8;

tempo_entre_ondas = 5 * game_get_speed(gamespeed_fps);
intervalo_spawn_base = 3.5 * game_get_speed(gamespeed_fps);
intervalo_spawn_atual = intervalo_spawn_base;

esperando_proxima_onda = true; 
timer_spawn = tempo_entre_ondas;

enum TIPO_INIMIGO {
    NORMIS,
    RAPIDO,
    TANQUE
}

primeiro_drop_realizado = false;

tempo_primeiro_drop = 3 * game_get_speed(gamespeed_fps); 
tempo_drop_base = 13.5 * game_get_speed(gamespeed_fps); 

timer_drop_recurso = tempo_primeiro_drop;