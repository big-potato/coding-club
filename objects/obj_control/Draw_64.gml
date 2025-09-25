/// @description Insert description here
// You can write your code in this editor
if youwin and !youlose //room == rm_win
	{
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_normal)
	
	//draw_text_transformed(room_width/2,room_height/2,"YOU WIN YOU WIN YOU WIN YOUW IN !!!!",3,3,3)
	draw_text_ext(room_width/2,room_height/2,"YOU WIN YOU WIN YOU WIN YOUW IN !!!!",100,200)
	
	}

if youlose
	{
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_normal)
		
	var textx = room_width/2
	var texty = room_height/2
	var text = "You Lose. Backspace to try again."
	var textw = string_width(text)
	var texth = string_height(text)
	var boxw = textw+30
	var boxh = texth+30
	
	draw_set_color(c_navy)
	draw_rectangle(textx-boxw/2,texty-boxh/2,textx+boxw/2,texty+boxh/2,false)
	draw_set_color(c_white)
		
	draw_text(textx,texty,text)
	}