/// @description Insert description here
// You can write your code in this editor



move_in_direction(spd,moveangle)



if collision_circle(x,y,5,obj_enemy,true,false) != noone
	{
	var collidedenemy = collision_circle(x,y,5,obj_enemy,true,false)
	
	instance_destroy()
	instance_destroy(collidedenemy)
	}