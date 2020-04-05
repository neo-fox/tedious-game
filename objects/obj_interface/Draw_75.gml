#region INTERFACE GUI GAMEPLAY
if game.app.state == fsm_game.play begin
	var _build = string(round(GM_build_date)) + "\n v " + GM_version  
	var _date = msg_time(false) + "\n" + msg_date("-")
	var _score =  "SCORE\n" + score_get_string()
	var _score_color = happy_sign < 0? c_red: c_white
	
	
	draw_gui(0,0, fa_right, fa_bottom, _build, fnt_game0, c_white, 1, 1)
	draw_gui(0,0, fa_left, fa_bottom, _date, fnt_game0, c_white, 1, 1)
	draw_gui(0,0, fa_right, fa_top, _score, fnt_game0, _score_color, 1, 1)
	

	if self.can_interact then 
		draw_gui(0, 0, fa_left, fa_top, "[F] " + self.message, fnt_game0, c_white, 1.0, 1.4)
end
#endregion

#region INTERFACE MENU LANG
else if game.app.state == fsm_game.lang begin
	draw_menu(0, t(msg.pt), display_get_gui_width()/3, 0, fa_left, fa_middle)
	draw_menu(1, t(msg.en), display_get_gui_width()/3, -30, fa_right, fa_middle)
end
#endregion

#region INTERFACE WARNING
else if game.app.state == fsm_game.warn begin
	var xx = display_get_gui_width()/2
	var yy = display_get_gui_height()/2
	
	self.step += 1 
	draw_set_font(fnt_game1)
	
	/// PROSEGUIR
	if self.step > room_speed * 19 then
		state_reset(game.app, fsm_game.intro)
		
	/// AVISO
	else if self.step > room_speed * 3 begin
		draw_set_halign(fa_center)
		draw_set_valign(fa_top)
		
		draw_text_transformed_color(xx, -64, t(msg.warn_title), 8, 8, 0, c_red, c_red, c_red, c_red, 1)		
		draw_text_ext_transformed_color(xx, 160, t(msg.warn_text), 32, xx - 16, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	end
	
	/// FAXETARIA
	else begin
		draw_sprite_ext(spr_esrb, 0, xx, yy, 1.2, 1.2, 0, c_white, 1)
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_game1)
		draw_text_ext_transformed_color(xx - (xx/8), yy -40, t(msg.esrb), 16, yy, 2.4, 2.4, 0, c_black, c_black, c_black, c_black, 1)
	end
end	
#endregion

#region ANIMATION INTRO
else if game.app.state == fsm_game.intro begin
	
	draw_gui(0, 0, fa_right, fa_middle, t(msg.game_name), lite()? fnt_game0: fnt_title, c_white, 1, lite()? 2.6: 0.8)
	draw_gui(0, 100, fa_center, fa_bottom, t(msg.press_start), fnt_game0, c_white, current_second%2)
end
#endregion

#region INTERFACE MENU MAIN
else if game.app.state == fsm_game.menuMain begin
	
	draw_gui(0, 0, fa_right, fa_middle, t(msg.game_name), lite()? fnt_game0: fnt_title, c_white, 1, lite()? 2.6: 0.8)
	
	draw_menu(0, t(msg.menu_start))
	draw_menu(1, t(msg.menu_config))
	draw_menu(2, t(msg.scorebord))
	draw_menu(3, t(msg.menu_exit), 10, 50)
end
#endregion

#region INTERFACE MENU OPTION
else if game.app.state == fsm_game.menuOptions begin
	

	draw_menu(0, t(msg.menu_lang))
	draw_menu(1, t(msg.menu_window))
	draw_menu(2, t(msg.menu_video))
	draw_menu(3, t(msg.menu_audio))
	draw_menu(4, t(msg.back), 10, 60)
	
	draw_item(0, t(game.app.lang), 200)
end
#endregion

#region INTERFACE MENU DISPLAY
else if game.app.state == fsm_game.menuWindow begin

	var menu_resolution = string(view_wport[0]) + "x" + string(view_hport[0])
	var menu_proportion = game.app.render.name_ratio[game.app.render.mode_ratio]
	var menu_fullscreen = fullscreen_get()
	var menu_font_speed = game.app.render.font_speed
	var menu_cam_speed = game.app.render.camera_speed
	
	
	draw_menu(0, t(msg.video_size))
	draw_menu(1, t(msg.video_ratio))
	draw_menu(2, t(msg.video_camspeed))
	draw_menu(3, t(msg.video_digto))
	draw_menu(4, t(msg.video_full))

	draw_menu(5, t(msg.back), 10, 60)
	
	draw_item(0, menu_resolution, 200)
	draw_item(1, menu_proportion, 200)
	draw_bars(2, menu_cam_speed, 200)
	draw_bars(3, menu_font_speed, 200)
	draw_chck(4, menu_fullscreen, 200)
end
#endregion

#region INTERFACE MENU GRAPHIC
else if game.app.state == fsm_game.menuGraphic begin

	var menu_reflex = game.app.render.reflex
	var menu_outline = game.app.render.outline
	var menu_hd_font = game.app.render.font_hd
	var menu_hd_light = game.app.render.light_hd

	draw_menu(0, t(msg.video_fnthd))
	draw_menu(1, t(msg.video_lighthd))
	draw_menu(2, t(msg.video_outline))
	draw_menu(3, t(msg.video_reflex))
	
	draw_menu(4, t(msg.back), 10, 60)
	
	if not lite() begin
		draw_chck(0, menu_hd_font, 200)
		draw_chck(1, menu_hd_light, 200)
		draw_chck(2, menu_outline, 200)
		draw_chck(3, menu_reflex, 200)
	end
end
#endregion

#region INTERFACE MENU AUDIO
else if game.app.state == fsm_game.menuAudio begin
	draw_menu(0, t(msg.menu_audio_geral))
	draw_menu(1, t(msg.menu_audio_music))
	draw_menu(2, t(msg.menu_audio_sfx))
	draw_menu(3, t(msg.back), 10, 60)
	
	
	draw_bars(0, game.app.audio.volume, 200)
	draw_bars(1, game.app.audio.mixer[0], 200)
	draw_bars(2, game.app.audio.mixer[1], 200)
end
#endregion

#region GAMEOVER 
else if game.app.state == fsm_game.over begin
	var xx = display_get_gui_width()/2
	var yy = display_get_gui_height()/2
	
	draw_set_font(fnt_game1)
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_set_color(c_red)
	
	draw_text_transformed(xx, -64, t(msg.gameover_title), 8, 8, 0)		
	
	draw_set_color(c_white)
	draw_text_ext_transformed(xx, 192, t(msg.gameover_text), 32, xx - 16, 2, 2, 0)
	draw_input(game.app.nickname, max_nickname)
	
	draw_gui(0, 0, fa_center, fa_bottom,  "SCORE: " + score_get_string(),fnt_game0, c_white, 4)
end
#endregion

#region CREDITS
else if game.app.state == fsm_game.credits begin
	var xx = display_get_gui_width()/2
	
	step += game.app.input.key_menu_enter? 4: 1
	
	draw_set_font(fnt_game0)
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)

	/// Reiniciar jogo
	if step > credits_scene.final then
		with game.app event_user(ev_mygame_restart)

	/// Em memoria de:
	else if step > credits_scene.memorial  begin
		var yy = display_get_gui_height() - self.step + credits_scene.memorial
		draw_text_ext_transformed_color(xx, yy, t(msg.memorial), 32, display_get_gui_width() - 16, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	end
	
	/// Agredicimentos
	else begin
		var yy = display_get_gui_height() - self.step
		draw_text_ext_transformed_color(xx, yy, t(msg.credits), 32, display_get_gui_width() - 16, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	end
	
end
#endregion

#region WAIT FOCUS
else if game.app.state == fsm_game.waitFocus begin
	draw_sprite(spr_jolt, 0, display_get_gui_width()/2, display_get_gui_height()/2)
	draw_gui(0, display_get_gui_height()/4, fa_center, fa_bottom, "mouse click to focus game", fnt_game1, c_white, current_second%2)
end
#endregion