var render_x = x + offset_shake_x;
var render_y = y + offset_shake_y;

draw_sprite_ext(
    sprite_index, 
    image_index, 
    render_x, 
    render_y, 
    1, 
    1, 
    image_angle, 
    image_blend,
    image_alpha
);

draw_sprite_ext(spr_engrenagem, 0, x - 5, y, 1.4, 1.4, rot * 1, c_white, image_alpha);
draw_sprite_ext(spr_engrenagem, 0, x - 34, y - 16, 1, 1, rot * -1, c_white, image_alpha);