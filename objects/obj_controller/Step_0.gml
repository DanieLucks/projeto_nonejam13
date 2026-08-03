timer_spawn -= 1;

if (timer_spawn <= 0) {   
    var indice_lane = irandom(array_length(lanes_y) - 1);
    var spawn_y = lanes_y[indice_lane];
    var spawn_x = room_width + 40; 
    
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_inimigo);
    
    tempo_spawn_max = max(game_get_speed(gamespeed_fps), tempo_spawn_max * 0.98); 
    timer_spawn = tempo_spawn_max;
}

if (vida_nucleo <= 0) {
    show_message("Game Over! O Núcleo foi destruído.");
    game_restart();
}