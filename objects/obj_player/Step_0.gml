//Controls
_key_left = keyboard_check(vk_left);
_key_right = keyboard_check(vk_right);
_key_jump = keyboard_check(vk_space);

//Movement
h_speed = _key_right-_key_left;
v_speed = 0;

x += h_speed * 4;
y += v_speed;