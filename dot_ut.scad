/**
 * @file dot_ut.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Dot unit tests.
 */

include <openBrick/dot.scad>

openBrick_dot();

translate([0, 10]) openBrick_dot(h=openBrick_brick_height);

include <openBrick/board.scad>
include <openBrick/brick.scad>

translate([10, 0]) openBrick_board();
translate([10, 10]) openBrick_brick();
