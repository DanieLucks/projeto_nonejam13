velocidade_queda = 1.2;
valor_recurso = 25;

coletado = false;
no_chao = false;

tempo_vida = 10 * game_get_speed(gamespeed_fps);

tempo_balanco = random(100);
velocidade_balanco = 0.08;
amplitude_balanco = 18;
x_centro = x;

escala = 1.0;
timer_coleta = 0;
fase_coleta = 0;

call_later(1, time_source_units_frames, function() {
    if (drop_fixo) {
        no_chao = true;
        alvo_y = y;
    }
});