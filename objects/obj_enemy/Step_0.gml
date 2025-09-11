/// @description Insert description here
// You can write your code in this editor


if instance_exists(obj_player)
	{
	// look for the player and face it
	playerdir = point_direction(x,y,obj_player.x,obj_player.y)
	
	moveangle = playerdir
	}

// go
move_in_direction(spd,moveangle)
