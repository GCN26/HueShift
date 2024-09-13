switch_timer++;
if(switch_timer >= switch_target){
	switch_timer = 0;
	global.game_color += 1;
}