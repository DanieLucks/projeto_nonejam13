if (!coletado) {
    coletado = true;

    if (instance_exists(obj_controller)) {
        obj_controller.engrenagens_estoque += valor_recurso;
    }
    
    var qtd_particulas = 4;
    for (var i = 0; i < qtd_particulas; i++) {
        var p = instance_create_layer(x, y, "Instances", obj_drop_particula);
        p.direcao_x = random_range(-2, 2);
    }
}