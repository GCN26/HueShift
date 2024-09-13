if(!instance_exists(obj_button)&&global.game_pause){
	PauseMenu();
}
if(instance_exists(obj_button)&&!global.game_pause){
	GameMenuClear();
}