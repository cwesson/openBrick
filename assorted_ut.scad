/**
 * @file assorted_ut.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Brick unit tests.
 */

include <openBrick/brick.scad>
include <openBrick/board.scad>

translate([0, 0]) openBrick_brick_array(2,4);

translate([20, 0]) openBrick_brick_array(2,2);

translate([20, 20]) openBrick_brick_array(2,1);

translate([40, 0]) openBrick_brick_array(1,4);

translate([50, 0]) openBrick_brick_map([
	[0, 1, 0],
	[1, 1, 1],
	[1, 0, 1]
]);

translate([0, 40]) openBrick_board_array(2,4);

translate([20, 40]) openBrick_board_array(2,2);

translate([20, 60]) openBrick_board_array(2,1);

translate([40, 40]) openBrick_board_array(1,4);

translate([50, 30]) openBrick_board_map([
	[0, 1, 0],
	[1, 1, 1],
	[1, 0, 1]
]);

translate([80, 0]) openBrick_board_array(2, 4, studs=false);

translate([80, 40]) openBrick_board_array(2, 2, studs=false);

translate([60, 60]) openBrick_board_array(4, 1, studs=false);
