/// @description Insert description here
// You can write your code in this editor

if(show_text) 
{
    // Camera and GUI
    var cam = view_camera[0];
    var view_x = camera_get_view_x(cam);
    var view_y = camera_get_view_y(cam);
    var view_w = camera_get_view_width(cam);
    var view_h = camera_get_view_height(cam);

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // Anchor to the center of the sign
    var anchor_x = x + sprite_width * 0.5 - sprite_xoffset;
    var anchor_y = y + sprite_height * 0.5 - sprite_yoffset;

    // Get actual location of sign from the gui
    var gui_x = ((anchor_x - view_x) * (gui_w / view_w)) - 2;
    var gui_y = (anchor_y - view_y) * (gui_h / view_h);

    // Text settings
    var padding = 12;
    var max_width = 300;

    draw_set_font(TutorialSignFont);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var txt_w = min(string_width_ext(text, -1, max_width), max_width);
    var txt_h = string_height_ext(text, -1, max_width);
	
	var base_offset = 60;   // how high the bubble sits for 1 line
	var extra_offset = txt_h * 0.5; // increase for multi-line text
	gui_y -= (base_offset + extra_offset);

    // Background box
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(gui_x - txt_w/2 - padding, gui_y - txt_h/2 - padding, gui_x + txt_w/2 + padding, gui_y + txt_h/2 + padding, false);

    // Outline
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_text_ext(gui_x+1, gui_y+1, text, -1, max_width);

    // Text
    draw_set_color(c_white);
	draw_set_alpha(0.7);
    draw_text_ext(gui_x, gui_y, text, -1, max_width);

    // Tail for background box
    draw_triangle_color(gui_x - 6, gui_y + txt_h/2 + padding, gui_x + 6, gui_y + txt_h/2 + padding, gui_x,     gui_y + txt_h/2 + padding + 10, c_black, c_black, c_black, false);
	
	draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}



