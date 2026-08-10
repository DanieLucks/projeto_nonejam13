
if (global.pausado) exit;


global.angulo_base_engrenagem = (global.angulo_base_engrenagem + global.velocidade_global_engrenagem) % 360;


if (vida_nucleo <= 0) {
    show_message("Game Over! O Núcleo foi destruído.");
    game_restart();
    exit;
}


lanes_ativas_indices = [];
var max_lanes = array_length(lanes_y); 
var centro_idx = floor(max_lanes / 2);  

if (onda_atual <= 2) {
    lanes_ativas_indices = [centro_idx - 1, centro_idx, centro_idx + 1];
} 

else if (onda_atual <= 4) {
    lanes_ativas_indices = [centro_idx - 2, centro_idx - 1, centro_idx, centro_idx + 1, centro_idx + 2];
} 

else {
    for (var i = 0; i < max_lanes; i++) {
        array_push(lanes_ativas_indices, i);
    }
}

if (esperando_proxima_onda) {
    timer_spawn -= 1;
    
    if (timer_spawn <= 0 && !instance_exists(par_enemy)) {
        esperando_proxima_onda = false;
        inimigos_gerados_onda = 0;
        
        inimigos_por_onda = floor(8 + (onda_atual * 2.5));
        intervalo_spawn_atual = max(0.8 * game_get_speed(gamespeed_fps), intervalo_spawn_base * power(0.92, onda_atual));
        timer_spawn = intervalo_spawn_atual;
    }
    exit;
}

timer_spawn -= 1;

if (timer_spawn <= 0) {
    var rand_idx = irandom(array_length(lanes_ativas_indices) - 1);
    var idx_real = lanes_ativas_indices[rand_idx];
    
    var spawn_y = lanes_y[idx_real];
    var spawn_x = room_width + 40;
    
    var novo_inimigo = instance_create_layer(spawn_x, spawn_y, "Instances", par_enemy);
    
    var chance = random(100);
    var tipo_escolhido = TIPO_INIMIGO.NORMIS;
    
    if (onda_atual >= 2 && chance < 25 + (onda_atual * 2)) {
        tipo_escolhido = TIPO_INIMIGO.RAPIDO;
    } else if (onda_atual >= 3 && chance > 80 - (onda_atual * 2)) {
        tipo_escolhido = TIPO_INIMIGO.TANQUE;
    }
    
    with (novo_inimigo) {
        switch (tipo_escolhido) {
            case TIPO_INIMIGO.NORMIS:
                sprite_index = spr_inimigo;
                velocidade = 0.25;
                vida_max = 3 + floor(other.onda_atual * 0.5);
                dano_ao_nucleo = 1;
                break;
                
            case TIPO_INIMIGO.RAPIDO:
                sprite_index = spr_inimigo_1;
                velocidade = 0.45;
                vida_max = 2 + floor(other.onda_atual * 0.3);
                dano_ao_nucleo = 1;
                amplitude_avanco = 1.8;
                velocidade_passo = 0.14;
                break;
                
            case TIPO_INIMIGO.TANQUE:
                sprite_index = spr_inimigo_2;
                velocidade = 0.12;
                vida_max = 8 + floor(other.onda_atual * 1.2);
                dano_ao_nucleo = 2;
                image_xscale = 1.7;
                image_yscale = 1.7;
                break;
        }
        vida = vida_max;
    }
    
    inimigos_gerados_onda += 1;
    
    if (inimigos_gerados_onda >= inimigos_por_onda) {
        esperando_proxima_onda = true;
        onda_atual += 1;
        timer_spawn = tempo_entre_ondas;
    } else {
        timer_spawn = intervalo_spawn_atual * random_range(0.85, 1.15);
    }
}


if (!global.pausado) {
    timer_drop_recurso -= 1;
    
    if (timer_drop_recurso <= 0) {
        var tamanho_grid = 32;

        var min_x = 160; 
        var max_x = room_width - 192; 
        
        var centro_y = 352;
        var y_minimo = centro_y - (3 * tamanho_grid);
        var y_maximo = centro_y + (3 * tamanho_grid);

        var spawn_x = round(random_range(min_x, max_x) / tamanho_grid) * tamanho_grid;
        var final_y = round(random_range(y_minimo, y_maximo) / tamanho_grid) * tamanho_grid;

        var novo_drop = instance_create_layer(spawn_x, -32, "Instances", obj_drop);
        novo_drop.alvo_y = final_y;

        if (!primeiro_drop_realizado) {
            primeiro_drop_realizado = true;
        }
        
        timer_drop_recurso = tempo_drop_base * random_range(0.85, 1.15);
    }
}