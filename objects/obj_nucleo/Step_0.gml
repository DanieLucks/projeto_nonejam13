if (keyboard_check_released(ord("F"))) {
    var _drop_x = irandom_range(64, room_width - 64);
    var _drop_y = irandom_range(64, room_height - 64);
    
    var _tipos_engrenagens = [obj_engrenagem_pequena, obj_engrenagem_media, obj_engrenagem_grande];

    var _engrenagem_sorteada = _tipos_engrenagens[irandom(2)];

    var _nova_instancia = instance_create_layer(_drop_x, _drop_y, "Instances", _engrenagem_sorteada);
	
	with (_nova_instancia) {
        estava_no_mapa = false; 
    }
}