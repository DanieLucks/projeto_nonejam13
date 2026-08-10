if (global.pausado) exit;

if (sendo_arrastada) {
    var tamanho_grid = 32;
    x = mouse_x;
    y = mouse_y;
    depth = -9999;
    
    posicao_valida = true;
    

    var ocupante = instance_position(x, y, par_engrenagem);
    if (instance_exists(ocupante) && ocupante != id) {
        posicao_valida = false;
    }
    

    if (instance_exists(obj_nucleo)) {
        var centro_y = obj_nucleo.y;
        var y_minimo = centro_y - (3 * tamanho_grid);
        var y_maximo = centro_y + (3 * tamanho_grid);

        if (y < y_minimo || y > y_maximo || x < 160) {
            posicao_valida = false;
        }
    }
} 
else {
    depth = -y;
    
    if (!armada) {
        timer_armar -= 1;
        if (timer_armar <= 0) {
            armada = true;
        }
    } 
    else {
        var vitima = instance_place(x, y, par_enemy);
        
        if (vitima != noone) {
            // Dispara explosao em area
            effect_create_above(ef_explosion, x, y, 1.2, c_orange);
            effect_create_above(ef_smoke, x, y, 0.8, c_dkgray);
            
            var lista_atingidos = ds_list_create();
            var total = collision_circle_list(x, y, raio_explosao, par_enemy, false, true, lista_atingidos, false);
            
            for (var i = 0; i < total; i++) {
                with (lista_atingidos[| i]) {
                    vida = 0;
                    hit_timer = 10;
                }
            }
            
            ds_list_destroy(lista_atingidos);
            instance_destroy();
        }
    }
}