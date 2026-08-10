vida -= other.dano;
hit_timer = 8;

with (other) {
    instance_destroy();
}

if (vida <= 0) {
    instance_destroy();
}