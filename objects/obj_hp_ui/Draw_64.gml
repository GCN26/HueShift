if(!global.game_pause){
	var _player_hp = global.player_health;
	var _player_hp_max = global.player_health_max;

	for(var i = 1; i <= _player_hp_max;i++){
		var _img_index = (i > _player_hp);
		draw_sprite(spr_hp,_img_index,60+((i-1)*60),8);
	}
	draw_set_font(fnt_font_size_48);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text(4,28,"HP: ");
}