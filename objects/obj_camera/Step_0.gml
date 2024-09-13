if(!global.game_pause){
	if(instance_exists(obj_player)){
		follow = obj_player;
	}
	if(follow != noone){
		xTo = follow.x;
		yTo = follow.y;
	}

	x += round((xTo - x)/10);
	y += round((yTo - y)/10);

	x = clamp(x,cam_w*.5,room_width-(cam_w*.5));
	y = clamp(y,cam_h*.5,room_height-(cam_h*.5));

	x += random_range(-shake_remain,shake_remain);
	y += random_range(-shake_remain,shake_remain);
	shake_remain = max(0,shake_remain-((1/shake_length)*shake_mag));

	camera_set_view_pos(view_camera[0],x-(cam_w*.5),y-(cam_h*.5));
}