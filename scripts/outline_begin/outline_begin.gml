if not variable_instance_exists(self, "can_interact") then 
	exit

if self.can_interact begin
	var outline = os_browser == browser_not_a_browser? 1: 2
	outline_start(outline, 0xFFFFFF)
end