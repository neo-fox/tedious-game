if self.state == fsm_player.none then
	exit

else if self.state == fsm_player.died then
	exit

else if self.state == fsm_player.dying then
	exit
		
else if self.state == fsm_player.sit then
	exit

else if self.state == fsm_player.sleep then
	exit

else if self.state == fsm_player.drink then
	exit

else if abs(self.axis_x) then
	self.state = fsm_player.walk

else 
	self.state = fsm_player.idle