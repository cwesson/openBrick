/**
 * @file full_ut.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Brick unit tests.
 */

include <openBrick/brick.scad>
include <openBrick/board.scad>
include <openBrick/dot.scad>

translate([0, 0]) openBrick_brick_array(2, 4);

translate([20, 0]) openBrick_brick_map(
	[[4,3,0],
	 [3,2,1],
	 [1,0,1],
	 [0,1,1]]
);

translate([0, 40]) openBrick_brick_array(2, 4, studs=false);

translate([20, 40]) openBrick_brick_map(
	[[4,3,0],
	 [3,2,1],
	 [1,0,1],
	 [0,1,1]],
	studs=false
);

translate([60, 0]) openBrick_board_array(2, 4);

translate([80, 0]) openBrick_board_map(
	[[1,1,0],
	 [1,1,1],
	 [1,0,1],
	 [0,1,1]]
);

translate([60, 40]) openBrick_board_array(2, 4, studs=false);

translate([80, 40]) openBrick_board_map(
	[[1,1,0],
	 [1,1,1],
	 [1,0,1],
	 [0,1,1]],
	studs=false
);

translate([120, 0]) openBrick_dot();
translate([120, 10]) openBrick_dot(h=openBrick_brick_height);
