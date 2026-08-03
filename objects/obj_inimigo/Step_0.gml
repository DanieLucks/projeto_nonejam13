x -= velocidade;

if (x < 64) {
    if (instance_exists(obj_controller)) {
        obj_controller.vida_nucleo -= 1;
    }
    instance_destroy();
}