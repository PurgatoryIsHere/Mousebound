/// @description Check for timer start
// You can write your code in this editor

if(type = "")
{
	if (place_meeting(x, y, O_Player) && timer_going == false)
	{
		audio_play_sound(_759501__gammagool__tick_tock_dry, 1, true)
		sprite_index = S_Timer_On
		timer_going = true
		alarm[0] = room_speed * set_timer
		destroy_gates();
	}
}


else if(type = "enemy")
{
	if(place_meeting(x, y, O_Player) && !timer_going)
	{
		audio_play_sound(_759501__gammagool__tick_tock_dry, 1, true)
		sprite_index = S_Timer_On;
		timer_going = true;
		alarm[1] = room_speed * set_timer;
	}
	
	if(timer_going && !instance_exists(O_EnemyParent))
	{
		goal_achieved = true;
		timer_going = false;
		audio_stop_sound(_759501__gammagool__tick_tock_dry);
		alarm[1] = -1;
		destroy_gates();
		instance_deactivate_object(self);
	}
}

if(timer_going)
{
	if(type = "")
	{
		time_remaining = alarm[0] / room_speed;
	}
	
	else if(type = "enemy")
	{
		time_remaining = alarm[1] / room_speed;
	}
}

if(goal_achieved)
{
	timer_going = false;
	audio_stop_sound(_759501__gammagool__tick_tock_dry);
	alarm[0] = -1;
	instance_deactivate_object(self);
}

// Screen white-out effects
if(fading_out) 
{
    fade_alpha += fade_speed;
	
    if (fade_alpha >= 1) 
	{
        fade_alpha = 1;
        fading_out = false;
		O_Player.input_enabled = false;
		
		room_restart();

        fading_in = true;
    }
}

if(fading_in) 
{
    fade_alpha -= fade_speed;
	
    if (fade_alpha <= 0) 
	{
        fade_alpha = 0;
        fading_in = false;
		
		O_Player.input_enabled = true;
    }
}