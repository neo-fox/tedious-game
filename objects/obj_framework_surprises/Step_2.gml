if game.app.state != fsm_game.play then
	exit

#region HALF LIFE USE SOUND
if game.app.input.key_interact and self.select == thematic.halflife begin
	if game.app.interface.can_interact then
		audio_play(game.app.player.x, game.app.player.y, snd_halflife_done, false)
	else 
		audio_play(game.app.player.x, game.app.player.y, snd_halflife_deny, false)
end
#endregion
#region HALF LIFE WALK SOUND
if game.app.player.state == fsm_player.walk and self.select == thematic.halflife then with game.app.player begin
	var _sound = self.speed >= 2? snd_halflife_step4: snd_halflife_step2
	
	//show_debug_message(image_index)
	//if not self.image_index % 4 then
	//	
		
	//else if self.image_index == 4 then
	//	audio_play(self.x, self.yfoot, _sound, false)
	
end
#endregion