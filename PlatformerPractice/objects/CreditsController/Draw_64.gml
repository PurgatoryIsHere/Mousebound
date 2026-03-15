/// @description Credits Text
// You can write your code in this editor

if(room == CreditsScreen)
{
    draw_set_halign(fa_left);
    draw_set_font(global.menu_options_font);

    // Black transparent overlay
    draw_set_alpha(0.4);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    draw_set_color(c_white);

    var x_pos = 16;
    var y_start = 40 + credit_scroll; // include scroll offset
    var y_pos = y_start;

    var section_spacing = 40;
    var entry_spacing = 30;

    var total_height = 0;

    for(var i = 0; i < array_length(credits); i++)
    {
        var sec = credits[i];

        // Draw section title
        draw_text_transformed(x_pos, y_pos, sec.title, sec.scale, sec.scale, 0);
        y_pos += section_spacing;
        total_height += section_spacing;

        // Draw entries
        for(var j = 0; j < array_length(sec.entries); j++)
        {
            draw_text_transformed(x_pos + 12, y_pos, sec.entries[j], 0.65, 0.65, 0);
            y_pos += entry_spacing;
            total_height += entry_spacing;
        }

        y_pos += 20;
        total_height += 20;

        // SFX Section
        if(sec.title == "Music:")
        {
            draw_text_transformed(x_pos, y_pos, "Sound Effects:", sec.scale, sec.scale, 0);
            y_pos += section_spacing;
            total_height += section_spacing;

            draw_text_transformed(x_pos + 12, y_pos, "mhtaylor67, Isaac200000, ertfelda, TheStarKing, NenadSimic, kwahmah_02,", 0.65, 0.65, 0);
            y_pos += entry_spacing;
            total_height += entry_spacing;

            draw_text_transformed(x_pos + 12, y_pos, "EVRetro, 16bitstudios, dodrio, lesaucisson, stumpbutt, mykiscool,", 0.65, 0.65, 0);
            y_pos += entry_spacing;
            total_height += entry_spacing;

            draw_text_transformed(x_pos + 12, y_pos, "Robinhood76, florianreichelt, Sadiquecat, GammaGool", 0.65, 0.65, 0);
            y_pos += entry_spacing;
            total_height += entry_spacing;

            y_pos += 20;
            total_height += 20;
        }

        // Playtesters Section
        if(sec.title == "Credits Theme:")
        {
            draw_text_transformed(x_pos, y_pos, "Playtesters:", sec.scale, sec.scale, 0);
            y_pos += section_spacing;
            total_height += section_spacing;

            draw_text_transformed(x_pos + 12, y_pos, "Extreme11ama, Windell (World Record), Chase Wayne Coffey (first place speed runner),", 0.65, 0.65, 0);
            y_pos += entry_spacing;
            total_height += entry_spacing;

            draw_text_transformed(x_pos + 12, y_pos, "Cian Monaghan, Nicholas Claeys, ScarletRy, gellypish, Gluestix.exe", 0.65, 0.65, 0);
            y_pos += entry_spacing;
            total_height += entry_spacing;

            y_pos += 20;
            total_height += 20;
        }
    }

    // Scroll Clamping
    var view_h = display_get_gui_height();
    var max_scroll = 0;
    var min_scroll = -(total_height - view_h + 60);

    credit_scroll = clamp(credit_scroll, min_scroll, max_scroll);

    // Return to menu prompt
    if(return_to_menu)
    {
        draw_text_transformed(display_get_gui_width() - 225, display_get_gui_height() - 50, "Press [ENTER]...", 0.65, 0.65, 0);
    }
}

else
{
    if(fade_alpha > 0)
    {
        draw_set_alpha(fade_alpha);
        draw_set_color(c_black);
        draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
        draw_set_alpha(1);
    }
}


