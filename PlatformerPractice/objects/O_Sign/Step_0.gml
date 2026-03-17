/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(O_Player) <= 8) 
{
    show_text = true;
	depth = O_Player.depth + 1;
} 

else 
{
    show_text = false;
}