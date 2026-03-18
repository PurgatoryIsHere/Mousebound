 /// @description Insert description here
// You can write your code in this editor

if(sprite_index == S_TopGround && (place_meeting(x, y - sprite_height, O_Ground) || place_meeting(x, y - sprite_height, O_HiddenWall)))
{
	sprite_index = S_Ground	
}