automato_alvo = noone;

global.pausado = true;

alvo_min_angulo = random_range(110, 150); 
alvo_max_angulo = alvo_min_angulo - random_range(40, 60);

pressao_angulo = 210;         
velocidade_pressao = 0;       
aceleracao = 0.35;            
gravidade_vazamento = 0.15;   
friccao = 0.94;               

dentro_da_zona = false;