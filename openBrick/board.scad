/**
 * @file openBrick/board.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Modules for rendering boardss (1/3 the height of a brick).
 */

include <block.scad>

/**
 * Renders a 1x1 board.
 * @param studs Set to false to not render studs.
 */
module openBrick_board(studs=true){
	openBrick_block(height=openBrick_board_height, studs=studs);
}

/**
 * Renders an XxY array of boards.
 * @param x Number of rows.
 * @param y Number of columns.
 * @param studs Set to false to not render studs.
 */
module openBrick_board_array(x, y, studs=true){
	openBrick_block_array(x, y, height=openBrick_board_height, studs=studs);
}

/**
 * Renders an array of boards based on the given matrix.
 * For each element in the matrix, if the element is not zero, a board is rendered.
 * @param map Matrix of bricks to render.
 * @param studs Set to false to not render studs.
 */
module openBrick_board_map(map, studs=true){
	openBrick_block_map(map, height=openBrick_board_height, studs=studs);
}

