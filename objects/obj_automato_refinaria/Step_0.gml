event_inherited();

if global.pausado exit

if (!pifado && !sendo_arrastada && tem_energia && !esta_quebrada) {
    
    if (timer_producao > 0) {
        timer_producao -= (1 * (velocidade_rotacao / 2));
    } else {
        
        var drop = instance_create_layer(x + random_range(-12, 12), y + 16, "Instances", obj_engrenagem_drop);
       drop.depth = - 999
        
        effect_create_above(ef_smoke, x, y - raio, 0.4, c_white);
        
        timer_producao = tempo_producao_base;
    }
}