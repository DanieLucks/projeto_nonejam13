// Titulo: Renderizacao dos Frames e Animacao
var subimagem = no_chao ? 0 : 1;

// Ligeira inclinacao visual durante o balanco do paraquedas
var angulo = no_chao ? 0 : (cos(tempo_balanco) * 8);

draw_sprite_ext(
    sprite_index, 
    subimagem, 
    x, 
    y, 
    escala, 
    escala, 
    angulo, 
    image_blend, 
    image_alpha
);