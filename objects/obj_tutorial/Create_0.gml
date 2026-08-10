passos_tutorial = [];
passo_atual = 0;
ativo = false;

if (!variable_global_exists("tutorial_pifa_exibido")) {
    global.tutorial_pifa_exibido = false;
}

function adicionar_passo(_titulo, _texto, _x, _y) {
    array_push(passos_tutorial, {
        titulo: _titulo,
        texto: _texto,
        pos_x: _x,
        pos_y: _y
    });
}

adicionar_passo("BEM-VINDO!", "Sua missão é proteger o Núcleo dos Zumbis!\n", room_width / 2, room_height / 2);

adicionar_passo("RECURSOS", "Suprimentos podem chegar.\nClique neles para coletar!", room_width / 2, 100);

adicionar_passo("CONSTRUÇÃO", "Arraste os cards de máquinas até as lanes para defender.\nVocê precisa de engrenagens para funcionarem!", room_width / 2.5, room_height / 2.5);

adicionar_passo("PLANEJAMENTO", "As máquinas bloqueiam sua rede de engrenagens.\nVocê só pode conectar uma engrenagem a outra.", room_width / 2, room_height / 2);

adicionar_passo("ALERTAS DE ONDA", "Fique atento aos alertas piscando no lado direito!\nEles indicam de onde as próximas hordas virão.", room_width / 2, room_height / 1.6);

if (array_length(passos_tutorial) > 0) {
    ativo = true;
    global.pausado = true;
}