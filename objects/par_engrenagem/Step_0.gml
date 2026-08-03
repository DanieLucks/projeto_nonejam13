if (sendo_arrastada) {
    var tamanho_grid = 32;
	
    var grid_x = round(mouse_x / tamanho_grid) * tamanho_grid;
    var grid_y = round(mouse_y / tamanho_grid) * tamanho_grid;
    
    x = mouse_x;
    y = mouse_y;
    
    pai_candidato = noone;
    var menor_distancia = 9999;

    if (instance_exists(obj_nucleo)) {
        with (obj_nucleo) {
            var em_linha_reta_nucleo = (abs(grid_x - x) <= 4 || abs(grid_y - y) <= 4);
            var dist_nucleo = point_distance(grid_x, grid_y, x, y);
            var alcance_nucleo = other.raio + raio + 8;
            
            if (em_linha_reta_nucleo && dist_nucleo <= alcance_nucleo) {
                other.pai_candidato = id;
                menor_distancia = dist_nucleo;
            }
        }
    }
    
    with (par_engrenagem) {
        if (id != other.id && !esta_quebrada && tem_energia && !scr_eh_descendente(id, other.id)) {
            var em_linha_reta = (abs(grid_x - x) <= 4 || abs(grid_y - y) <= 4);
            var dist = point_distance(grid_x, grid_y, x, y);
            var alcance_conectar = other.raio + raio + 8;
            
            if (em_linha_reta && dist <= alcance_conectar && dist < menor_distancia) {
                other.pai_candidato = id;
                menor_distancia = dist;
            }
        }
    }
   
    if (instance_exists(pai_candidato)) {
        x_ancora = grid_x;
        y_ancora = grid_y;
        posicao_valida = scr_validar_posicao_encaixe(grid_x, grid_y, pai_candidato);
    } else {
        posicao_valida = false;
    }
} 
else {
    scr_processar_engrenagem();
}