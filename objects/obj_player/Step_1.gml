#region INPUTS
axis_x = game.app.input.key_axis_x
#endregion


#region COLISON HORIZOTAL
var next_x = self.x + (16 * axis_x)

repeat 2 begin
	if next_x < word.limit_left or next_x > word.limit_right or p_door() begin
		axis_x = 0
		hspeed = 0
	end
	
	next_x = self.x + self.hspeed
end
#endregion

lite_step()


