if (global.pausado) exit;

rot += velocidade_base * 1.5 * sentido_rotacao;
rot = (rot + 360) % 360;

depth = -y +1;

if (keyboard_check_released(ord("R"))) {
	game_restart()
}

if (keyboard_check_released(ord("F"))) {
	obj_controller.engrenagens_estoque += 10
}


timer_shake -= 1;
	
if (timer_shake <= 0) {
    timer_shake = intervalo_shake;
        
    offset_shake_x = random_range(-tremor_intensidade, tremor_intensidade);
    offset_shake_y = random_range(0, tremor_intensidade);
}
    
timer_fumaca -= 1;
if (timer_fumaca <= 0) {
    timer_fumaca = random_range(15, 30);
        
    var chamine_x = x + offset_shake_x;
    var chamine_y = y - 96 + offset_shake_y;
        
    effect_create_above(ef_smokeup, chamine_x, chamine_y , 0.4, c_ltgray);
}