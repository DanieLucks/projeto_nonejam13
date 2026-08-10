var subimagem = armada ? 0 : 1;

if (sendo_arrastada) {
    var cor_previa = posicao_valida ? c_lime : c_red;
    draw_sprite_ext(sprite_topo, subimagem, x, y - 8, image_xscale, image_yscale, 0, cor_previa, 0.6);
} 
else {
    draw_sprite_ext(sprite_topo, subimagem, x, y - 8, image_xscale, image_yscale, 0, image_blend, image_alpha);
}