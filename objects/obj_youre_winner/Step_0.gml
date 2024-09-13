whee_timer++;

if(v_speed < 10) v_speed += grav;

if(whee_timer >= whee_target){
	whee_timer = 0;
	whee_target = 1000;
	v_speed = -jump_speed;
	timer = true;
}

if(timer == true){
	menu_timer++;
	WinGrav();
}

if(menu_timer >= menu_target){
	room_goto(room_main_menu);	
}