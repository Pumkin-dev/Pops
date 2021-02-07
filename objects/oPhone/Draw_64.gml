draw_set_color(c_black)
draw_rectangle(0, 0, global.view_width, global.view_height, false)
switch (state){
	case phone_state.inventory:
		var ds_grid = ds_grid_create(3, 2);
		var x_move = PRESSEDRIGHTKEY - PRESSEDLEFTKEY;
		var y_move = PRESSEDDOWNKEY - PRESSEDUPKEY;
		x_slot = Wrap(x_slot + x_move, 0, ds_grid_width(ds_grid) - 1);
		y_slot = Wrap(y_slot + y_move, 0, ds_grid_height(ds_grid) - 1)
		var x_buffer = 96;
		var y_buffer = 64;
		var i = 0; var _yy = 0, var _xx = 0; repeat(ds_list_size(ITEM))
		{
			if (_xx >= ds_grid_width(ds_grid)) { _yy++; }
			i %= ds_grid_width(ds_grid);
			var _item = ITEM[| i];
			ds_grid_add(ds_grid, _xx, _yy, _item);
			i++;
			_xx++;
		}
		var y_nb = 0; var x_nb = 0; repeat(ds_grid_height(ds_grid))
		{
			x_nb = 0;
			repeat (ds_grid_width(ds_grid))
			{
				_item = ds_grid[# x_nb, y_nb];
				var c = c_white;
				var _x = 2*x_buffer + (x_buffer + x_buffer/2)*x_nb;
				var _y = y_buffer + (y_buffer*2)*y_nb;
				if (x_slot == x_nb && y_slot == y_nb)
				{
					c = c_yellow;
				}
				draw_rectangle_color(_x, _y, _x + x_buffer, _y + y_buffer + y_buffer/2, c, c, c, c, false);
				if (!_item)
				{
				}
				else
				{
					draw_sprite(_item[? "sprite"], 0, _x + x_buffer/2, _y + (y_buffer + y_buffer/2)/2);
				}
				x_nb++;
			}
			y_nb++;
		}
		ds_grid_destroy(ds_grid);
		
}