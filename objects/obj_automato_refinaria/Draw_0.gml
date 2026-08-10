event_inherited();

if !sendo_arrastada {
		if (variable_instance_exists(id, "sprite_topo") && sprite_exists(sprite_topo)) {
	    draw_sprite_ext(sprite_topo, 0, x - 2, y - 16, image_xscale * .8, image_yscale * .8, 0, image_blend, image_alpha);
	}

}

if (!sendo_arrastada && !pifado && tem_energia && !esta_quebrada) {
    var pct_producao = (1 - (timer_producao / tempo_producao_base)) * 100;
    draw_healthbar(x - 12, y + 5, x + 12, y + 8, pct_producao, c_black, c_yellow, c_green, 0, true, false);
}