// Titulo: Soltar a Mina no Grid
if (!sendo_arrastada) exit;

sendo_arrastada = false;

if (posicao_valida) {
    var tamanho_grid = 32;
    x = round(x / tamanho_grid) * tamanho_grid;
    y = round(y / tamanho_grid) * tamanho_grid;
    
    if (!estava_no_mapa) {
        if (variable_instance_exists(id, "custo_compra")) {
            obj_controller.engrenagens_estoque -= custo_compra;
        }
        estava_no_mapa = true;
    }
 } else {
    instance_destroy(); // Destroi e cancela a compra se soltar em local invalido
} 