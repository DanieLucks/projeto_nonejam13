velocidade = 0.2;
vida_max = 3;
vida = vida_max;
dano_ao_nucleo = 1;

image_xscale = 1.2;
image_yscale = 1.2; 
depth = -y;

sprite_index = choose(spr_inimigo, spr_inimigo_1, spr_inimigo_2)

hit_timer = 0;

tempo_passo = random(100);      
velocidade_passo = 0.08;     
amplitude_avanco = 1.2;      
amplitude_inclinacao = 4;       
offset_passo_x = 0;

esta_desacelerado = false;
timer_desacelerado = 0;
fator_desaceleracao = 1.0;