event_inherited();

if !sendo_arrastada {
		if (variable_instance_exists(id, "sprite_topo") && sprite_exists(sprite_topo)) {
	    draw_sprite_ext(sprite_topo, 0, x + 3, y - 13, image_xscale * .8, image_yscale * .8, 0, image_blend, image_alpha);
	}
}