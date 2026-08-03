event_inherited();

if (!pifado && !sendo_arrastada && tem_energia && !esta_quebrada) {
    
    if (tempo_recarga > 0) {
         tempo_recarga -= (1 * (velocidade_rotacao / 2)); 
    } else {
        var alvo_na_linha = noone;
        var meu_x = x;
        var meu_y = y;
        var alcance = alcance_linha;
        
        with (obj_inimigo) {
            if (abs(y - meu_y) <= 16 && x > meu_x && (x - meu_x) <= alcance) {
                alvo_na_linha = id;
                break;
            }
        }
        
        if (instance_exists(alvo_na_linha)) {
            instance_create_layer(x + raio, y, "Instances", obj_projetil);
            tempo_recarga = cadencia_base;
        }
    }
}