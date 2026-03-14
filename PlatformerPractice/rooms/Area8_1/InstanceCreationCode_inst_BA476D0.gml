TriggerEvent = function()
{
	if(global.checkpoint_x != noone && global.checkpoint_y != noone)
	{
		global.checkpoint_x = x;
		global.checkpoint_y = y;
	}
	
	instance_destroy(self);
}