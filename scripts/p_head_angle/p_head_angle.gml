/// @description xscale

var _olhar = game.app.player.axis_looking * 14 
var _lado = sign(argument0)

if self.state == fsm_player.dying and image_index < 3 then
	_olhar = 0
	
else if self.state == fsm_player.dying then
	_olhar = 14
	
else if sad() >= 0.8 and _olhar < 0 then
	_olhar = 0

else if sad() >= 0.4 then
	_olhar += sad() * 7
	
if _lado then 
	return 360 - clamp(_olhar, -14, 14)
	
else
	return clamp(_olhar, -14, 14) 
	
	