vida -= other.dano;

with (other) {
    instance_destroy();
}

if (vida <= 0) {
    instance_destroy();
}