/// @description Insert description here
// You can write your code in this editor



move_in_direction(spd,moveangle)



if collision_circle(x,y,5,targetobj,true,false) != noone
	{
	var collidedobj = collision_circle(x,y,5,targetobj,true,false)
	
	instance_destroy()
	instance_destroy(collidedobj)
	}
	
if position_meeting(x,y,obj_wall) instance_destroy()

