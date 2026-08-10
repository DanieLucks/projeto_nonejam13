var render_y = y + offset_y_flutuacao;


draw_sprite_ext(sprite_index, image_index, x, y + 8, 0.8, 0.3, 0, c_black, 0.3);


draw_sprite_ext(
    sprite_index, 
    image_index, 
    x, 
    render_y, 
    .8,     
    .8,                
    0,                 
    image_blend, 
    image_alpha
);