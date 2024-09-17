function ScreenShake(mag,frames){
	with(obj_camera){
		if(mag>shake_remain){
			shake_mag = mag;
			shake_remain = shake_mag;
			shake_length = frames;
		}
	}
}

function WinGrav(){
	if(place_meeting(x,y+v_speed,obj_col)){
	while(!place_meeting(x,y+sign(v_speed),obj_col)){
		y += sign(v_speed);	
	}
	v_speed = 0;
	}
	y += v_speed;
}

function MenuRespawn(){
	MenuClear();
	level_select = instance_create_layer(176,112,"Instances",obj_button,{text: "Level Select",script_to: LevelSelect,script_arg: [-1],image_xscale:7,image_yscale:1.5});
	controls = instance_create_layer(176,172,"Instances",obj_button,{text: "Controls",script_to: ControlsButton,script_arg: [-1],image_xscale:7,image_yscale:1.5});
	credits = instance_create_layer(176,232,"Instances",obj_button,{text: "Credits",script_to: CreditsButton,script_arg: [-1],image_xscale:7,image_yscale:1.5});
	game_exit = instance_create_layer(176,292,"Instances",obj_button,{text: "Exit",script_to: game_end,script_arg: [-1],image_xscale:7,image_yscale:1.5});
}

function MenuClear(){
	instance_destroy(obj_button);
	instance_destroy(obj_text);
}
function GameMenuClear(){
	instance_destroy(obj_button);
}

function LevelSelect(){
	MenuClear();
	tutorial = instance_create_layer(176,112,"Instances",obj_button,{text: "Tutorial",script_to: room_goto,script_arg: [room_tutorial],image_xscale:7,image_yscale:1.5});
	easy = instance_create_layer(176,172,"Instances",obj_button,{text: "Easy",script_to: room_goto,script_arg: [room_easy_level],image_xscale:7,image_yscale:1.5});
	hard = instance_create_layer(176,232,"Instances",obj_button,{text: "Hard",script_to: room_goto,script_arg: [room_hard_level],image_xscale:7,image_yscale:1.5});
	instance_create_layer(176,292,"Instances",obj_button,{text: "Main Menu",script_to: MenuRespawn,script_arg: [-1],image_xscale:7,image_yscale:1.5});
}

function ControlsButton(){
	MenuClear();
	instance_create_layer(176,154,"Instances",obj_text,{text: "Movement: Arrow Keys\nJump: Space Bar\nColor Change: Left Shift\nPause: Escape"});
	instance_create_layer(176,272,"Instances",obj_button,{text: "Main Menu",script_to: MenuRespawn,script_arg: [-1],image_xscale:7,image_yscale:2});
}

function CreditsButton(){
	MenuClear();
	instance_create_layer(180,162,"Instances",obj_text,{text: "Programming and Art by Gibby S\nFont \"m5x7\" by Daniel Linssen\nSound Effects by Pixabay\nMusic by Gaston A-P from Pixabay"});
	music = instance_create_layer(160,208,"Instances",obj_button,{text: " ",script_to: url_open,script_arg: ["https://pixabay.com/users/xtremefreddy-32332307/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=145362"],image_xscale:4,image_yscale:1,image_alpha:0});
	instance_create_layer(176,272,"Instances",obj_button,{text: "Main Menu",script_to: MenuRespawn,script_arg: [-1],image_xscale:7,image_yscale:2});
}

function PauseMenu(){
	instance_create_layer(x,y,"Instances",obj_mouse_tracker);
	instance_create_depth(obj_camera.x,112,-1000,obj_button,{text: "Resume",script_to: Unpause,script_arg: [-1],image_xscale:7,image_yscale:1.5});
	instance_create_depth(obj_camera.x,172,-1000,obj_button,{text: "Main Menu",script_to: room_goto,script_arg: [room_main_menu],image_xscale:7,image_yscale:1.5});
	instance_create_depth(obj_camera.x,232,-1000,obj_button,{text: "Restart Level",script_to: room_restart,script_arg: [-1],image_xscale:7,image_yscale:1.5});
	instance_create_depth(obj_camera.x,292,-1000,obj_button,{text: "Exit",script_to: game_end,script_arg: [-1],image_xscale:7,image_yscale:1.5});
}

function GameOverRestart(){
	var _prev_room = obj_room_num.room;
	instance_destroy(obj_room_num);
	room_goto(_prev_room);
}

function Unpause(){
	global.game_pause = !global.game_pause;
}