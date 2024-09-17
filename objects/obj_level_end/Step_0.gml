if(place_meeting(x,y,obj_player)&&obj_player.state == PlayerStateFree){
	//Play an animation before room transition
	if(obj_player.state != PlayerStateWin){
		audio_play_sound(snd_win,1,0);
		obj_player.state = PlayerStateWin;
	}
}
if(obj_player.win_fin == true){
	room_goto(target_room);
}