/// @description Insert description here
// You can write your code in this editor


// player movement   ------------------------------------------

inputleft = keyboard_check(vk_left)   
inputright = keyboard_check(vk_right)
inputup = keyboard_check(vk_up)
inputdown = keyboard_check(vk_down)
inputclick = mouse_check_button_pressed(mb_left)

inputhorizontal = inputright-inputleft
inputvertical = inputdown-inputup


if inputhorizontal != 0 or inputvertical != 0 
	{
	moveangle = point_direction(x,y,x+inputhorizontal,y+inputvertical)
	
	move_in_direction(spd,moveangle)
	}


//  shoot

if inputclick
	{
	var newbullet = instance_create_depth(x,y,depth+1,obj_bullet)
	newbullet.moveangle = point_direction(x,y,mouse_x,mouse_y)
	}


//  player collision

if place_meeting(x,y,obj_enemy) 
	{
	var collidedenemy = instance_place(x,y,obj_enemy)
	
	instance_destroy()
	instance_destroy(collidedenemy)
	}
	