//Controls
_key_left = keyboard_check(vk_left);
_key_right = keyboard_check(vk_right);
_key_jump = keyboard_check_pressed(vk_space);
_key_color = keyboard_check_pressed(vk_shift);
_key_sprint = keyboard_check(vk_control);

if(!global.game_pause){
	script_execute(state);
	image_speed = 1;
}
else image_speed = 0;

depth = -99;

