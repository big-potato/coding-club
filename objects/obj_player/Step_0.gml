/// @description Insert description here
// You can write your code in this editor


// player movement   ------------------------------------------

inputleft = keyboard_check(vk_left) or keyboard_check(ord("A"))
inputright = keyboard_check(vk_right) or keyboard_check(ord("D"))
inputup = keyboard_check(vk_up) or keyboard_check(ord("W"))
inputdown = keyboard_check(vk_down) or keyboard_check(ord("S"))
inputclick = mouse_check_button_pressed(mb_left)
inputclick_held = mouse_check_button(mb_left)
inputspace = keyboard_check_pressed(vk_space)

inputhorizontal = inputright-inputleft
inputvertical = inputdown-inputup

#region

if superfasttimer > 0 
	{
	issuperfast = true
	superfasttimer --
	}
else issuperfast = false

if machineguntimer > 0 
	{
	ismachinegun = true
	machineguntimer --
	}
else ismachinegun = false

#endregion


if isdashing
	{
	instance_create_depth(x,y,depth+1,obj_dashtrail)
	movespd = dashspd
	isinvincible = true
	}
else
	{
	if inputhorizontal != 0 or inputvertical != 0 
		{
		moveangle = point_direction(x,y,x+inputhorizontal,y+inputvertical)
		if issuperfast 
			{
			movespd = superfastspd
			}
		else movespd = normalspd
		}
	else movespd = 0
	
	if inputspace
		{
		isdashing = true
		alarm[0] = 10
		}
	isinvincible = false
	}


//  shoot

if inputclick or (inputclick_held and ismachinegun)
	{
	var newbullet = instance_create_depth(x,y,depth+1,obj_bullet_good)
	newbullet.moveangle = point_direction(x,y,mouse_x,mouse_y)
	}


//  player collision

move_in_direction_walls(movespd,moveangle)



if place_meeting(x,y,obj_enemy) and !isinvincible
	{
	var collidedenemy = instance_place(x,y,obj_enemy)
	
	instance_destroy()
	instance_destroy(collidedenemy)
	}

if place_meeting(x,y,obj_pickup)
	{
	var collidedpickup = instance_place(x,y,obj_pickup)
	with collidedpickup event_user(0)
	instance_destroy(collidedpickup)
	}



//   visuals

if issuperfast 
	{
	drawangle += 5
	}
else drawangle = 0