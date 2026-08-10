// Titulo: Desenho da Interface de Tutorial
if (!ativo) exit;

var passo = passos_tutorial[passo_atual];

// 1. ESCURECE A TELA INTEIRA (Destaque Focado)
draw_set_color(c_black);
draw_set_alpha(0.65);
draw_rectangle(0, 0, room_width, room_height, false);

// 2. CONFIGURAÇÕES DA CAIXA DE TEXTO
var largura = 420;
var altura = 180;
var px = clamp(passo.pos_x, largura / 2 + 10, room_width - largura / 2 - 10);
var py = clamp(passo.pos_y, altura / 2 + 10, room_height - altura / 2 - 10);

var x1 = px - (largura / 2);
var y1 = py - (altura / 2);
var x2 = px + (largura / 2);
var y2 = py + (altura / 2);

// 3. CAIXA DE DIÁLOGO E BORDA
draw_set_color(c_black);
draw_set_alpha(0.95);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_orange); // Borda em tom Steampunk/Laranja
draw_set_alpha(1.0);
draw_rectangle(x1, y1, x2, y2, true);

// 4. DESENHO DO TÍTULO E DESCRIÇÃO
draw_set_font(fnt_base);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Título
draw_set_color(c_yellow);
draw_text(px, y1 + 10, passo.titulo);

// Texto explicativo
draw_set_color(c_white);
draw_text_ext(px, y1 + 32, passo.texto, -1, largura - 20);

// Indicador de clique no rodapé
var alpha_pisca = 0.5 + sin(current_time * 0.01) * 0.4;
draw_set_color(c_gray);
draw_set_alpha(alpha_pisca);
draw_text(px, y2 - 18, "Espaço para continuar>>");

// Reseta alinhamento e opacidade
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1.0);