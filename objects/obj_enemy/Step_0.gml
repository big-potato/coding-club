/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_player)
	{
	//
	playerdir = point_direction(x,y,obj_player.x,obj_player.y)
	}

// go
move_in_direction_walls(spd,moveangle)


if avoidsenemies
	{
	if place_meeting(x,y,obj_enemy)
		{
		var collidingenemy = instance_place(x,y,obj_enemy)
		while place_meeting(x,y,collidingenemy)
			{
			var enemyangle = point_direction(collidingenemy.x,collidingenemy.y,x,y)
			move_in_direction_walls(0.5,enemyangle)
			with collidingenemy move_in_direction_walls(0.5,enemyangle+180)
			}
		}
	}