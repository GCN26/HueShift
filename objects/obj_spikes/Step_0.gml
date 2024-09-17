if(global.game_color == color || color == 0){
	if(place_meeting(x,y,obj_player)){
		global.player_health = 0;
	}
}
if(color != 0){
		if(global.game_color == color){
			image_alpha = 1;	
		}
		else{
			image_alpha = .5;
		}
	}