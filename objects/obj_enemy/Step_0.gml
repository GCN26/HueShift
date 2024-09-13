if(!global.game_pause){
	EnemyCollision();

	if(EnemyCollision()) h_speed = h_speed * -1;
	if(v_speed < 10) v_speed += grav;

	if(h_speed > 0) dir = 1;
	if(h_speed < 0) dir = -1;

	image_xscale = dir;

	if(color == 0 || color = global.game_color){
		EnemyPlayerInteraction();
	}
	if(color != 0){
		if(global.game_color == color){
			image_alpha = 1;	
		}
		else{
			image_alpha = .5;
		}
	}
	image_speed = 1;
}
else image_speed = 0;