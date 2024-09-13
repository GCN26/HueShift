function PlayerStateFree(){
//Movement
h_speed = _key_right-_key_left;
if(v_speed < 10) v_speed += grav;

PlayerCollision();



++swap_cooldown;

if(h_speed > 0) dir = 1;
if(h_speed < 0) dir = -1;

image_xscale = dir;
if(global.game_color == 1){
	if(place_meeting(x,y+1,[obj_col,obj_col_red])&&h_speed == 0) sprite_index = spr_playerf;
	else if(place_meeting(x,y+1,[obj_col,obj_col_red])&&h_speed != 0) sprite_index = spr_playerf_move;
	else sprite_index = spr_playerf_jump;
}
if(global.game_color == 2){
	if(place_meeting(x,y+1,[obj_col,obj_col_green])&&h_speed == 0) sprite_index = spr_playerf;
	else if(place_meeting(x,y+1,[obj_col,obj_col_green])&&h_speed != 0) sprite_index = spr_playerf_move;
	else sprite_index = spr_playerf_jump;
}
if(global.game_color == 3){
	if(place_meeting(x,y+1,[obj_col,obj_col_blue])&&h_speed == 0) sprite_index = spr_playerf;
	else if(place_meeting(x,y+1,[obj_col,obj_col_blue])&&h_speed != 0) sprite_index = spr_playerf_move;
	else sprite_index = spr_playerf_jump;
}

if(_key_color && swap_cooldown > swap_cooldown_target){
	audio_play_sound(snd_swap,1,0);
	global.game_color += 1;	
	swap_cooldown = 0;
}

if(hit == true) PlayerHit();	
}

function PlayerHit(){
	i_frames++;
	
	if(i_frames % 2 == 1) image_alpha = 0;
	if(i_frames % 2 == 0) image_alpha = 1;
	
	if(i_frames > i_frames_target){
		i_frames = 0;
		hit = false;
		can_hit = true;
		image_alpha = 1;
	}
}

function PlayerStateDie(){
	global.game_pause = false;
	image_alpha = 1;
	death_timer++;
	if(v_speed < 10) v_speed += grav;
	if(death == false){
		v_speed = -jump_speed;
		audio_play_sound(snd_game_over,1,0);
		death = true;
	}
	y += v_speed;
	
	sprite_index = spr_playerf_die;
	
	if(death_timer >= death_target){
		death_timer = 0;
		room_goto(room_game_over);
	}
}

function PlayerStateWin(){
	global.game_pause = false;
	image_alpha = 1;
	win_timer++;
	v_speed = -jump_speed;
	y += v_speed;
	if(win_timer >= win_target){
		win_fin = true;
	}
}