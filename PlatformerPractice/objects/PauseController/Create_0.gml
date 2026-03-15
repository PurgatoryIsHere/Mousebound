/// @description Initialize
// You can write your code in this editor

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

pause = false;
pause_surf = -1;
pause_surf_buffer = noone;

current_room = 0;

pause_music = noone;
timer_active = false;