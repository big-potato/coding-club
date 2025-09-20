/// @description Insert description here
// You can write your code in this editor

event_inherited()

shoottimer -= 1

if instance_exists(obj_player)
	{
	var playerdist = point_distance(x,y,obj_player.x,obj_player.y)
	
	if playerdist > playerproximity
		{
		moveangle = playerdir
		}
	else
		{
		moveangle = playerdir-180
		}
	
	if playerdist < playerproximity+10 and shoottimer <= 0
		{
		// shoot
		var newbullet = instance_create_depth(x,y,depth+1,obj_bullet_evil)
		newbullet.moveangle = playerdir
		shoottimer = shootinterval
		}
	
	}

