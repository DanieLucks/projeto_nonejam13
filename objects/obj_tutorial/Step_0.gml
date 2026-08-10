depth = -room_height
if (!global.tutorial_pifa_exibido && !ativo) {
    var maquina_pifada = noone;
      with (par_automato) {

        if (object_index == obj_engrenagem) continue;
        
        if (variable_instance_exists(id, "pifado") && pifado) {
            maquina_pifada = id;
            break;
        } else if (variable_instance_exists(id, "energizado") && !energizado) {
            maquina_pifada = id;
            break;
        } else if (variable_instance_exists(id, "ligado") && !ligado) {
            maquina_pifada = id;
            break;
        }
    }
    
    if (instance_exists(maquina_pifada)) {
        global.tutorial_pifa_exibido = true;
        
        passos_tutorial = [];
        passo_atual = 0;
        
        adicionar_passo(
            "MÁQUINA PIFADA!", 
            "Esta máquina parou de funcionar!\nClique nela antes que o tempo acabe\npara realizar a manutenção.", 
            room_width/1.6, 
            room_height/1.6
        );
        
        ativo = true;
        global.pausado = true;
    }
}


if (!ativo) exit;

if (keyboard_check_pressed(vk_space)) {
    passo_atual += 1;
    
    if (passo_atual >= array_length(passos_tutorial)) {
        ativo = false;
        global.pausado = false;
    }
}