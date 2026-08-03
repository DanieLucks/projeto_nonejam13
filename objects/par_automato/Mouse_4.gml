if (pifado) {
    pifado = false;
    image_blend = c_white;
    tempo_para_pifar = random_range(20, 35) * game_get_speed(gamespeed_fps);
    exit;
}

event_inherited();