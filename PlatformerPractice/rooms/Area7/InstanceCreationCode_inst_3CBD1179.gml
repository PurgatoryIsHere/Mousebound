TriggerEvent = function()
{
	if(global.area7_hub_checkpoint_active)
	{
		instance_destroy(self);
	}
	
	else
	{
		global.area7_hub_checkpoint_active = true;
		instance_destroy(self);
	}
}