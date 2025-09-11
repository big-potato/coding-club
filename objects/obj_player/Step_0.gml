/// @description Insert description here
// You can write your code in this editor


// player movement   ------------------------------------------

inputleft = keyboard_check(vk_left) or keyboard_check(ord("A"))
inputright = keyboard_check(vk_right) or keyboard_check(ord("D"))
inputup = keyboard_check(vk_up) or keyboard_check(ord("W"))
inputdown = keyboard_check(vk_down) or keyboard_check(ord("S"))
inputclick = mouse_check_button_pressed(mb_left)
inputspace = keyboard_check_pressed(vk_space)

inputhorizontal = inputright-inputleft
inputvertical = inputdown-inputup

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
		movespd = normalspd
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

if inputclick
	{
	var newbullet = instance_create_depth(x,y,depth+1,obj_bullet)
	newbullet.moveangle = point_direction(x,y,mouse_x,mouse_y)
	}


//  player collision

	// find target coords
xspd = lengthdir_x(movespd,moveangle)
yspd = lengthdir_y(movespd,moveangle)
var targx = x+xspd
var targy = y+yspd

	// if not wall hit at target coordinates...
if !place_meeting(targx,targy,obj_wall)
	{
	// ...move like normal
	x = targx
	y = targy
	}
	// else
else
	{
	// move pixel-by-pixel horizontal until you've moved the full distance or would hit the wall.
	while x != targx
		{
		var xmovedir = sign(targx-x)
		if place_meeting(x+xmovedir,y,obj_wall) break
		else 
			{
			if median(x,x+xmovedir,targx) == targx   // if you're overshooting...
				{
				x = targx // snap to destination
				break
				}
			else x += xmovedir
			}
		}
	
	// move pixel-by-pixel vertical until you've moved the full distance or would hit the wall.
	while y != targy
		{
		var ymovedir = sign(targy-y)
		if place_meeting(x,y+ymovedir,obj_wall) break
		else 
			{
			if median(y,y+ymovedir,targy) == targy   // if you're overshooting...
				{
				y = targy // snap to destination
				break
				}
			else y += ymovedir
			}
		}
	}
	



if place_meeting(x,y,obj_enemy) and !isinvincible
	{
	var collidedenemy = instance_place(x,y,obj_enemy)
	
	instance_destroy()
	instance_destroy(collidedenemy)
	}


//   visuals


