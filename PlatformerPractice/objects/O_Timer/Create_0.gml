/// @description Set tag and time
// You can write your code in this editor

timer_going = false
goal_achieved = false;
gates = noone;

set_timer = 3
time_remaining = 0;

// empty for standard timer, 'enemy' for defeat all enemies within the time to trigger event
type = "";

// Screen white-out effects for  'enemy' type
fade_alpha = 0;
fading_out = false;
fading_in = false;
fade_speed = 0.05;

destroy_gates = function()
{
	for(var i = 0; i < array_length(gates); i ++)
	{
		var pos = gates[i];
		var gate = instance_position(pos[0], pos[1], O_TimerGate);
		instance_destroy(gate);
	}
}

restore_gates = function()
{
	for (var i = 0; i < array_length(gates); i++) 
	{
		var pos = gates[i];
		instance_create_layer(pos[0], pos[1], "Instances", O_TimerGate);
	}
}