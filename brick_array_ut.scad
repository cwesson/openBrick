/**
 * @file brick_ut.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Brick unit tests.
 */

include <openBrick/brick.scad>

translate([0, 0]) openBrick_brick_array(1, 4);

translate([0, 35]) openBrick_brick_array(4, 1);

translate([15, 0]) openBrick_brick_array(2, 4);

translate([35, 0]) openBrick_brick_array(5, 5);

translate([85, 0]) openBrick_brick_array(1, 10);

translate([0, 50]) openBrick_brick_array(10, 1);
