/**
 * @file board_ut.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Plate unit tests.
 */

include <openBrick/board.scad>

openBrick_board();

translate([20, 0]) openBrick_board_array(2, 4);

translate([50, 0]) openBrick_board_map(
	[[1,1,0],
	 [1,1,1],
	 [1,0,1],
	 [0,1,1]]
);

translate([0, 50]) openBrick_board(studs=false);

translate([20, 50]) openBrick_board_array(2, 4, studs=false);

translate([50, 50]) openBrick_board_map(
	[[1,1,0],
	 [1,1,1],
	 [1,0,1],
	 [0,1,1]],
	studs=false
);
