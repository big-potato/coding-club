// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_in_direction(len,dir){
x = x+lengthdir_x(len,dir)
y = y+lengthdir_y(len,dir)
}


function move_in_direction_walls(len,dir){
var xspd = lengthdir_x(len,dir)
var yspd = lengthdir_y(len,dir)
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
	
}
