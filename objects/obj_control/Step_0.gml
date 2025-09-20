/// @description Insert description here
// You can write your code in this editor
if room == rm_start
	{
	if mouse_check_button_pressed(mb_left)
		{
		room_goto(rm_main)
		}
	}

if room == rm_main or room == rm_walls
	{
	if instance_number(obj_enemy) == 0
		{
		room_goto(rm_win)
		}
	}