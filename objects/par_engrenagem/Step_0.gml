if (sendo_arrastada) {
    x = mouse_x;
    y = mouse_y;
    

    pai_candidato = noone;
    posicao_valida = false;
    var menor_distancia = 99999;
    
    if (instance_exists(obj_nucleo)) {
        var dist_nucleo = point_distance(x, y, obj_nucleo.x, obj_nucleo.y);
        var alcance_snap = raio + obj_nucleo.raio + 40;
        
        if (dist_nucleo <= alcance_snap) {
            pai_candidato = obj_nucleo;
            menor_distancia = dist_nucleo;
        }
    }
    
with (par_engrenagem) {
    if (id != other.id && !esta_quebrada && tem_energia && !scr_eh_descendente(id, other.id)) {
        var dist = point_distance(other.x, other.y, x, y);
        var alcance_snap = other.raio + raio + 40;
        
        if (dist <= alcance_snap && dist < menor_distancia) {
            other.pai_candidato = id;
            menor_distancia = dist;
        }
    }
}
    
    if (instance_exists(pai_candidato)) {
        var angulo = point_direction(pai_candidato.x, pai_candidato.y, x, y);
        var distancia_ancora = pai_candidato.raio + raio;
        
        x_ancora = pai_candidato.x + lengthdir_x(distancia_ancora, angulo);
        y_ancora = pai_candidato.y + lengthdir_y(distancia_ancora, angulo);
        
        posicao_valida = scr_validar_posicao_encaixe(x_ancora, y_ancora, pai_candidato);
    }
} else {
    scr_processar_engrenagem();
}