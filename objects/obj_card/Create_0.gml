escala_base = 1.0;
escala_hover = 1.1;
escala_atual = 1.0;
velocidade_lerp = 0.2;

tremor_forca = 0;
tremor_decaimento = 0.85;
offset_shake_x = 0;
offset_shake_y = 0;

mouse_sobre = false;

enum TIPO_CARD {
    ENGRENAGEM,
    REFINARIA,
    TORRETA,
    EXPLOSIVO,
    STUN,
    CANO_DUPLO
}

tipo_item = _type;
sprite_item = noone;

custo = 0;
objeto_para_criar = noone;
descricao = "Descrição padrão da carta.";

switch (tipo_item) {
    case TIPO_CARD.ENGRENAGEM:
        custo = 10;
        objeto_para_criar = obj_engrenagem;
        sprite_item = spr_engrenagem;
        descricao = "Necessários para\nas máquinas funcionarem.";
        break;
        
    case TIPO_CARD.REFINARIA:
        custo = 20;
        objeto_para_criar = obj_automato_refinaria;
        sprite_item = spr_refinaria;
        descricao = "Gera engrenagens extras\nde tempos em tempos.";
        break;
        
    case TIPO_CARD.TORRETA:
        custo = 40;
        objeto_para_criar = obj_automato_tiro;
        sprite_item = spr_torreta;
        descricao = "Atira projéteis\ncontra os inimigos.";
        break;
        
    case TIPO_CARD.EXPLOSIVO:
        custo = 60;
        objeto_para_criar = obj_mina_explosiva;
        sprite_item = spr_explosivo;
        descricao = "Detona em área\nao ser pisada.";
        break;
    
    case TIPO_CARD.STUN:
        custo = 70;
        objeto_para_criar = obj_automato_stunner;
        sprite_item = spr_stunner;
        descricao = "Disparos que\ndesaceleram os inimigos.";
        break;
        
    case TIPO_CARD.CANO_DUPLO:
        custo = 80;
        objeto_para_criar = obj_automato_cano_duplo;
        sprite_item = spr_cano_duplo;
        descricao = "Dispara mais\nprojéteis.";
        break;
}

suficiente = false;
instancia_arrastando = noone;