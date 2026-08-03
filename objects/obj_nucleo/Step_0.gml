
if (keyboard_check_released(ord("F"))) {
    var _drop_x = irandom_range(128, room_width - 128);
    var _drop_y = irandom_range(128, room_height - 128);
    

    _drop_x = round(_drop_x / 32) * 32;
    _drop_y = round(_drop_y / 32) * 32;
    
    var _nova_engrenagem = instance_create_layer(_drop_x, _drop_y, "Instances", obj_engrenagem);
    
    with (_nova_engrenagem) {
        estava_no_mapa = false; // Indica que é um item novo
    }
}

if (keyboard_check_released(ord("R"))) {
    var _drop_x = irandom_range(128, room_width - 128);
    var _drop_y = irandom_range(128, room_height - 128);
    
    _drop_x = round(_drop_x / 32) * 32;
    _drop_y = round(_drop_y / 32) * 32;
    
    var _novo_automato = instance_create_layer(_drop_x, _drop_y, "Instances", obj_automato_tiro);
    
    with (_novo_automato) {
        estava_no_mapa = false;
    }
}

if (keyboard_check_released(ord("E"))) {
    var _drop_x = irandom_range(128, room_width - 128);
    var _drop_y = irandom_range(128, room_height - 128);
    
    _drop_x = round(_drop_x / 32) * 32;
    _drop_y = round(_drop_y / 32) * 32;
    
    var _novo_automato = instance_create_layer(_drop_x, _drop_y, "Instances", obj_automato_refinaria);
    
    with (_novo_automato) {
        estava_no_mapa = false;
    }
}