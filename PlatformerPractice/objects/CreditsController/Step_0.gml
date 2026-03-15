/// @description Fade out & Return to menu
// You can write your code in this editor

if(room != CreditsScreen)
{
	fade_alpha += fade_speed;
	
    if (fade_alpha >= 1) 
	{
        fade_alpha = 1;
        room_goto(CreditsScreen);
    }
}

else
{
	
	var scroll_input = 0;

	if(keyboard_check(vk_up) || keyboard_check(ord("W"))) 
	{
		scroll_input = credit_scroll_speed;
	}

	if(keyboard_check(vk_down) || keyboard_check(ord("S"))) 
	{
		scroll_input = -credit_scroll_speed;
	}

	credit_scroll += scroll_input;

	if(keyboard_check_pressed(vk_enter) && return_to_menu)
	{
		room_goto(MainMenu);
	}
}