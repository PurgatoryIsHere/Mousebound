/// @description Surface Capturing
// You can write your code in this editor

gpu_set_blendenable(false);

if(pause)
{
	surface_set_target(application_surface);
	
		if(surface_exists(pause_surf))
		{
			draw_surface_stretched(pause_surf, 0, 0, gui_w, gui_h + 0.1);
		}
	
		else
		{
			pause_surf = surface_create(gui_w, gui_h);
			buffer_set_surface(pause_surf_buffer, pause_surf, 0);
		}
	
	surface_reset_target();
}

if(keyboard_check_pressed(vk_backspace) && room != SplashScreen && room != MainMenu && room != CreditsScreen) 
{
    if(!pause) 
	{
        pause = true;
		current_room = room;
		
		if(BGMController.current_bgm != noone) 
		{
			audio_pause_sound(BGMController.current_bgm);
		}
		
		if(audio_is_playing(_759501__gammagool__tick_tock_dry))
		{
			audio_pause_sound(_759501__gammagool__tick_tock_dry);
			timer_active = true;
		}
		
		pause_music =  audio_play_sound(Sketchbook_2025_12_03_LOOP, 1, true);
		
		
        instance_deactivate_all(true);
		
        pause_surf = surface_create(gui_w, gui_h);
        
        surface_set_target(pause_surf);
			draw_surface(application_surface, 0, 0);
        surface_reset_target();
		
		if(buffer_exists(pause_surf_buffer))
		{
			buffer_delete(pause_surf_buffer);
		}
		
		pause_surf_buffer = buffer_create(gui_w * gui_h * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surf_buffer, pause_surf, 0);
    }
	
    else 
	{
        pause = false;
        instance_activate_all();
		
		audio_stop_sound(pause_music);
		pause_music = noone;
		
		audio_resume_sound(BGMController.current_bgm);
		
		if(timer_active)
		{
			audio_resume_sound(_759501__gammagool__tick_tock_dry);
			timer_active = false;
		}
		
        if(surface_exists(pause_surf))
		{
            surface_free(pause_surf);
        }
		
		if(buffer_exists(pause_surf_buffer))
		{
			buffer_delete(pause_surf_buffer);
		}
    }
}

gpu_set_blendenable(true);