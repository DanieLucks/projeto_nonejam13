if (pifado && tem_energia && !instance_exists(obj_minigame_pressao)) {
    var minigame = instance_create_layer(0, 0, "Instances", obj_minigame_pressao);
    minigame.automato_alvo = id;
    exit;
}

if (estava_no_mapa) {
    exit;
}

event_inherited();