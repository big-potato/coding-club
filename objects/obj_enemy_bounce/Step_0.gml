/// @description Insert description here
// You can write your code in this editor

event_inherited()

var spdx = lengthdir_x(spd,moveangle)
var spdy = lengthdir_y(spd,moveangle)

if place_meeting(x,y-1,obj_wall) or place_meeting(x,y+1,obj_wall) or y <= 0 or y >= room_height
	{
	spdy = -spdy
	}
	
if place_meeting(x-1,y,obj_wall) or place_meeting(x+1,y,obj_wall) or x <= 0 or x >= room_width
	{
	spdx = -spdx
	}

moveangle = point_direction(0,0,spdx,spdy)

if place_meeting(x,y,obj_enemy)
	{
	var collidedenemy = instance_place(x,y,obj_enemy)
	moveangle = point_direction(collidedenemy.x,collidedenemy.y,x,y)
	}