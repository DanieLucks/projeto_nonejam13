rot = 0;
rot_parado = 0;

engrenagem_pai = noone;
tem_energia = false;
esta_quebrada = false;
alinhado_com_pai = false; 

raio = 32; 
durabilidade_min = 100;
durabilidade_max = 200;

durabilidade_maxima_frames = 0;
durabilidade_atual = 0;

velocidade_rotacao = global.velocidade_global_engrenagem;
sentido_rotacao = 1; 
desgaste_multiplicador = 0.005;

sendo_arrastada = false;
pai_candidato = noone;
posicao_valida = false;
x_ancora = x;
y_ancora = y;

estava_no_mapa = false;
x_original = x;
y_original = y;
engrenagem_pai_original = noone;

depth = -y; 