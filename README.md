# openBrick

openBrick is an open source library for 3D printing snap-together toy building blocks.  It is written in OpenSCAD to allow easy flexibility in how blocks are constructed.  The dimensions of blocks can be easily tweaked to make them compatible with various similar products.

## Getting Started

To start using openBrick, download the source code and copy the openBrick directory into your OpenSCAD project.  In each scad file that needs to render openBricks, simply `include <openBrick/brick.scad>` or the file for the type of brick desired and use the modules listed in the openBrick API.  See the openBrick unit tests for examples of using the API.

### OpenSCAD

OpenSCAD is an open source solid 3D CAD modeling language.  More information on OpenSCAD can be found at http://www.openscad.org/.  The full language reference can be found in the [OpenSCAD User Manual](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language).

### Basics

The basic building block of openBrick in the block.  Each block is a 1x1 tile of the minimum height.  Blocks are combined to produce boards and bricks.  Boards are composed of blocks laid out in a grid in the X and Y dimensions.  Bricks are similar in composition to boards but are 3x as tall.  openBrick also includes dots, which are rounded 1x1 blocks.

## API

### Bricks

#### `brick([studs=true])`
Renders a 1x1x1 brick.  
studs - Set to false to not render studs.

#### `brick_array(x, y, [studs=true])`
Renders an XxY array of bricks.  
x - Number of blocks in the X dimension.  
y - Number of blocks in the Y dimension.  
studs - Set to false to not render studs.

#### `brick_map(map, [studs=true])`
Render an array of bricks based on the given map.  The height of each block in the brick is the height of a 1x1x1 brick times the value in the map at those coordinates.  
map - Map of heights for each block.  
studs - Set to false to not render studs.

### Boards

#### `board()`
 Renders a 1x1x1 board.  
 studs - Set to false to not render studs.

#### `board_array(X, Y)`
Renders an XxY array of boards.  
x - Number of blocks in the X dimension.  
y - Number of blocks in the Y dimension.  
studs - Set to false to not render studs.

#### `board_map(map)`
Render an array of boards based on the given map.  The height of each block in the board is the height of a 1x1x1 board times the value in the map at those coordinates.  
map - Map of heights for each block.  
studs - Set to false to not render studs.

### Dots

#### `dot([h], [studs=true])`
Render a 1x1 dot the height of a board.  
h - Height of the dot.  
studs - Set to false to not render studs.
