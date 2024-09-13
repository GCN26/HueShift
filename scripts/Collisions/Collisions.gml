function PlayerCollision(){
	var _x_collision = false;
	
	if(place_meeting(x,y+1,obj_col)){
		jumps_left = 1;
		v_speed = _key_jump * (jump_speed*-1);
		if(_key_jump) audio_play_sound(snd_jump,1,0);
	}
	if(_key_jump && jumps_left > 0){
		jumps_left -= 1;
		
	}
	
	if(place_meeting(x+(h_speed*move_speed),y,obj_col)){
		while(!place_meeting(x+sign(h_speed*move_speed),y,obj_col)){
			x += sign(h_speed*move_speed);	
		}
		h_speed = 0;
		_x_collision = true;
	}
	
	if(_x_collision != true){
	if(global.game_color == 1) _x_collision = PlayerCollisionRedX();
	if(global.game_color == 2) _x_collision = PlayerCollisionGreenX();
	if(global.game_color == 3) _x_collision = PlayerCollisionBlueX();
	}

	x += h_speed*move_speed;
	
	if(place_meeting(x,y+v_speed,obj_col)){
		while(!place_meeting(x,y+sign(v_speed),obj_col)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
	
	if(global.game_color == 1) PlayerCollisionRedY();
	if(global.game_color == 2) PlayerCollisionGreenY();
	if(global.game_color == 3) PlayerCollisionBlueY();
	
	y += v_speed;
	
	return _x_collision;
}

function PlayerCollisionRedX(){
	var _x_collision = false;
	if(place_meeting(x+(h_speed*move_speed),y,obj_col_red)){
		while(!place_meeting(x+sign(h_speed*move_speed),y,obj_col_red)){
			x += sign(h_speed*move_speed);	
		}
		h_speed = 0;
		_x_collision = true;
	}
}
function PlayerCollisionRedY(){
	if(place_meeting(x,y+1,obj_col_red)){
		jumps_left = 1;
		v_speed = _key_jump * (jump_speed*-1);
		if(_key_jump) audio_play_sound(snd_jump,1,0);
	}
	if(_key_jump && jumps_left > 0){
		jumps_left -= 1;
		
	}
	if(place_meeting(x,y+v_speed,obj_col_red)){
		while(!place_meeting(x,y+sign(v_speed),obj_col_red)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
}
function PlayerCollisionGreenX(){
	var _x_collision = false;
	if(place_meeting(x+(h_speed*move_speed),y,obj_col_green)){
		while(!place_meeting(x+sign(h_speed*move_speed),y,obj_col_green)){
			x += sign(h_speed*move_speed);	
		}
		h_speed = 0;
		_x_collision = true;
	}
}
function PlayerCollisionGreenY(){
	if(place_meeting(x,y+1,obj_col_green)){
		jumps_left = 1;
		v_speed = _key_jump * (jump_speed*-1);
		if(_key_jump) audio_play_sound(snd_jump,1,0);
	}
	if(_key_jump && jumps_left > 0){
		jumps_left -= 1;
		
	}
	if(place_meeting(x,y+v_speed,obj_col_green)){
		while(!place_meeting(x,y+sign(v_speed),obj_col_green)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
}
function PlayerCollisionBlueX(){
	var _x_collision = false;
	if(place_meeting(x+(h_speed*move_speed),y,obj_col_blue)){
		while(!place_meeting(x+sign(h_speed*move_speed),y,obj_col_blue)){
			x += sign(h_speed*move_speed);	
		}
		h_speed = 0;
		_x_collision = true;
	}
}
function PlayerCollisionBlueY(){
	if(place_meeting(x,y+1,obj_col_blue)){
		jumps_left = 1;
		v_speed = _key_jump * (jump_speed*-1);
		if(_key_jump) audio_play_sound(snd_jump,1,0);
	}
	if(_key_jump && jumps_left > 0){
		jumps_left -= 1;
		
	}
	if(place_meeting(x,y+v_speed,obj_col_blue)){
		while(!place_meeting(x,y+sign(v_speed),obj_col_blue)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
}

function PlayerCollisionOld(){
	var _col_list = ds_list_create();
	var _x_collision = false;
	
	if(place_meeting(x,y+1,obj_col)){
		jumps_left = 1;
		v_speed = _key_jump * (jump_speed*-1);
	}
	if(_key_jump && jumps_left > 0){
		jumps_left -= 1;
		
	}
	if(place_meeting(x,y+1,obj_col_color)){
		var _col = instance_place_list(x,y+1,obj_col_color,_col_list,true)
		while(_col > 0){
			var _col_check = _col_list[|0];
			if(_col_check.color == global.game_color){
				jumps_left = 1;
				v_speed = _key_jump * (jump_speed*-1);
				_col = 0;
			}
			else{}
			ds_list_delete(_col_list,0);
			_col--;
		}
	}
	
	if(place_meeting(x+(h_speed*move_speed),y,obj_col)){
		while(!place_meeting(x+sign(h_speed*move_speed),y,obj_col)){
			x += sign(h_speed*move_speed);	
		}
		h_speed = 0;
		_x_collision = true;
	}
	if(place_meeting(x+(h_speed*move_speed),y,obj_col_color)){
		var _col = instance_place_list(x+sign(h_speed*move_speed),y,obj_col_color,_col_list,true)
		while(_col > 0){
			var _col_check = _col_list[|0];
			if(_col_check.color == global.game_color){
				if(place_meeting(x+(h_speed*move_speed),y,obj_col_color)){
					while(!place_meeting(x+sign(h_speed*move_speed),y,obj_col_color)){
						x += sign(h_speed*move_speed);	
					}
					h_speed = 0;
					_x_collision = true;
				}
				_col = 0;
			}
			else{}
			ds_list_delete(_col_list,0);
			_col--;
		}
	}
	x += h_speed*move_speed;
	
	if(place_meeting(x,y+v_speed,obj_col)){
		while(!place_meeting(x,y+sign(v_speed),obj_col)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
	if(place_meeting(x,y+v_speed,obj_col_color)){
		var _col = instance_place_list(x,y+v_speed,obj_col_color,_col_list,true)
		while(_col > 0){
			var _col_check = _col_list[|0];
			if(_col_check.color == global.game_color){
				if(place_meeting(x,y+v_speed,obj_col_color)){
					while(!place_meeting(x,y+sign(v_speed),obj_col_color)){
						y += sign(v_speed);	
					}
					v_speed = 0;
				}
				_col = 0;
			}
			else{}
			ds_list_delete(_col_list,0);
			_col--;
		}
	}
	y += v_speed;
	
	
	ds_list_clear(_col_list);
	ds_list_destroy(_col_list);
	return _x_collision;
}

function EnemyCollision(){
	var _x_collision = false;
	var _col_tiles = [obj_col,obj_col_invis_enemy];
	
	if(place_meeting(x+(h_speed),y,_col_tiles)){
		while(!place_meeting(x+sign(h_speed),y,_col_tiles)){
			x += sign(h_speed);	
		}
		_x_collision = true;
	}
	if(_x_collision != true){
	if(color == 1) _x_collision = EnemyCollisionRedX();
	if(color == 2) _x_collision = EnemyCollisionGreenX();
	if(color == 3) _x_collision = EnemyCollisionBlueX();
	}

	x += h_speed;
	
	if(place_meeting(x,y+v_speed,_col_tiles)){
		while(!place_meeting(x,y+sign(v_speed),_col_tiles)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
	
	if(color == 1) EnemyCollisionRedY();
	if(color == 2) EnemyCollisionGreenY();
	if(color == 3) EnemyCollisionBlueY();
	
	y += v_speed;
	
	return _x_collision;
}

function EnemyCollisionRedX(){
	var _x_collision = false;
	if(place_meeting(x+(h_speed),y,obj_col_red)){
		while(!place_meeting(x+sign(h_speed),y,obj_col_red)){
			x += sign(h_speed);	
		}
		_x_collision = true;
		return _x_collision;
	}
}
function EnemyCollisionRedY(){
	if(place_meeting(x,y+v_speed,obj_col_red)){
		while(!place_meeting(x,y+sign(v_speed),obj_col_red)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
}
function EnemyCollisionGreenX(){
	var _x_collision = false;
	if(place_meeting(x+(h_speed),y,obj_col_green)){
		while(!place_meeting(x+sign(h_speed),y,obj_col_green)){
			x += sign(h_speed);	
		}
		_x_collision = true;
		return _x_collision;
	}
}
function EnemyCollisionGreenY(){
	if(place_meeting(x,y+v_speed,obj_col_green)){
		while(!place_meeting(x,y+sign(v_speed),obj_col_green)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
}
function EnemyCollisionBlueX(){
	var _x_collision = false;
	if(place_meeting(x+(h_speed),y,obj_col_blue)){
		while(!place_meeting(x+sign(h_speed),y,obj_col_blue)){
			x += sign(h_speed);	
		}
		_x_collision = true;
		return _x_collision;
	}
}
function EnemyCollisionBlueY(){
	if(place_meeting(x,y+v_speed,obj_col_blue)){
		while(!place_meeting(x,y+sign(v_speed),obj_col_blue)){
			y += sign(v_speed);	
		}
		v_speed = 0;
	}
}

function EnemyPlayerInteraction(){
	if(place_meeting(x,y,obj_player)&&obj_player.state == PlayerStateFree){
		if(obj_player.y < y-12){
			with(obj_player){
				v_speed = -jump_speed;
				audio_play_sound(snd_jump,1,0);
			}
			instance_destroy();
		}
		else{
			if(obj_player.can_hit == true){
				audio_play_sound(snd_hurt,1,0);
				global.player_health -= 1;
				ScreenShake(5,15);
				with(obj_player){
					hit = true;
					can_hit = false;
				}
			}
		}
	}
}