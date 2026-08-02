if (esta_quebrada) {
    instance_destroy();
    exit;
}

var alguma_arrastando = false;
with (par_engrenagem) {
    if (sendo_arrastada) alguma_arrastando = true;
}

if (!alguma_arrastando) {
    sendo_arrastada = true;
    
    x_original = x;
    y_original = y;
    engrenagem_pai_original = engrenagem_pai;
    estava_no_mapa = true;
    
    tem_energia = false; 
    
    var meu_id = id;
    with (par_engrenagem) {
        if (engrenagem_pai == meu_id) {
            engrenagem_pai = noone;
            tem_energia = false;
        }
    }
    
    engrenagem_pai = noone; 
    
    scr_recalcular_cadeia();
}