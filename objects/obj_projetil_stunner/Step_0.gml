if (global.pausado) exit;

x += velocidade_projetil;

var inimigo_atingido = instance_place(x, y, par_enemy);

if (inimigo_atingido != noone) {
    with (inimigo_atingido) {
        vida -= other.dano;
        hit_timer = 5;
        
        esta_desacelerado = true;
        timer_desacelerado = other.duracao_slow;
        fator_desaceleracao = other.porcentagem_slow;
    }
   
    
    instance_destroy(); 
}

if (x > room_width + 32) {
    instance_destroy();
}