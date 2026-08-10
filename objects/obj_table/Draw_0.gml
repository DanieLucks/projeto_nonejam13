draw_self()
draw_sprite_ext(spr_engrenagem_drop_1, 0, x, y + 6, 1.5, 1.5, 0, c_white, 1)

draw_set_color(c_black)
draw_set_halign(fa_center)
draw_text(x, y + 32, obj_controller.engrenagens_estoque)
draw_set_color(c_white)
