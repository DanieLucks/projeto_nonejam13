if (global.pausado) exit;

if (!coletado) {
    if (y < alvo_y && !drop_fixo) {
        y += velocidade_queda;
        
        tempo_balanco += velocidade_balanco;
        x = x_centro + sin(tempo_balanco) * amplitude_balanco;
        
        if (y >= alvo_y) {
            y = alvo_y;
            x = x_centro;
            no_chao = true;
        }
    } else {
        if (!drop_fixo) {
            tempo_vida -= 1;
            if (tempo_vida <= 0) instance_destroy();
        }
    }
} 
else {

    y -= 1.5;        
    image_alpha -= 0.12;
    
    if (image_alpha <= 0) {
        instance_destroy();
    }
}