if (esta_quebrada) {
    x = -9999;
    y = -9999;
    scr_recalcular_cadeia();
    instance_destroy();
    exit;
}

var alguma_arrastando = false;
with (par_engrenagem) {
    if (sendo_arrastada) alguma_arrastando = true;
}

if (sendo_arrastada) {
    depth = -9999;
} else {
    depth = -y;
}

if (!alguma_arrastando) {
    sendo_arrastada = true;
    
    x_original = x;
    y_original = y;
    engrenagem_pai_original = engrenagem_pai;
    estava_no_mapa = true;
    
    engrenagem_pai = noone;
    tem_energia = false;
    
    var old_x = x;
    var old_y = y;
    x = -9999;
    y = -9999;
    
    scr_recalcular_cadeia();
    
    x = mouse_x;
    y = mouse_y;
}