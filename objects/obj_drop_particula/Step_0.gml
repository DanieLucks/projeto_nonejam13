if (global.pausado) exit;

x += direcao_x;
y += velocidade_y;
velocidade_y += gravidade_particula; 

image_angle += rotacao_speed;
alfa -= 0.03;

if (alfa <= 0) {
    instance_destroy();
}