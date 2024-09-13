if(global.game_color > 3){
	global.game_color = 1;	
}
if(global.game_color == 0){
	global.game_color = 1;
}

if(global.player_health == 0) obj_player.state = PlayerStateDie;