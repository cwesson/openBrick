/**
 * @file openBrick/dimensions.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * List of brick measurements.
 * Tweak these for your slicer, printer, and desired brick size.
 */

//! Base unit for 1mm
mm = 1;

//! Base unit for 1cm
cm = 10*mm;

//! Width of the gap between bricks
openBrick_block_gap = 0.07*mm;

//! Height of 1 plate (w/o studs)
openBrick_plate_height = 3.14*mm;

//! Height of 1 brick (w/o stud)
openBrick_brick_height = (3*openBrick_plate_height)+(2*openBrick_block_gap);

//! Width of 1 brick
openBrick_block_width = 7.90*mm;

//! Thickness of walls
openBrick_block_wall = 1.08*mm;

//! Diameter of 1 stud
openBrick_stud_width = 5.02*mm;

//! Height of 1 stud
openBrick_stud_height = 1.76*mm;

//! Diameter of 1 stud
openBrick_hole_width = 4.86*mm;

//! Number of circle fragments
openBrick_fn = 100;

//! Model overlap amount
openBrick_d = 0.001*mm;
