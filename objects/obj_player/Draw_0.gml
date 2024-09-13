shader_set_uniform_f(shader_get_uniform(shader_r,"original_color"),255.0,255,255);
shader_set_uniform_f(shader_get_uniform(shader_g,"original_color"),255.0,255,255);
shader_set_uniform_f(shader_get_uniform(shader_b,"original_color"),255.0,255,255);
if(global.game_color == 1) shader_set(shader_r);
if(global.game_color == 2) shader_set(shader_g);
if(global.game_color == 3) shader_set(shader_b);
draw_self();
shader_reset();