# openBrick

openBrick is an open source library for 3D printing snap-together toy building blocks.  It is written in OpenSCAD to allow easy flexibility in how blocks are constructed.  The dimensions of blocks can be easily tweaked to make them compatible with various similar products.

## Getting Started

To start using openBrick, download the source code and copy thhe openBrick directory into your OpenSCAD project.  In each scad file that needs to render openBricks, simpily `include <openBrick/brick.scad>` or the file for the type of brick desired and use the modules listed in the openBrick API.  See the openBrick unit tests for examples of using the API.

### OpenSCAD

OpenSCAD is an open source solid 3D CAD modelling language.  More information on OpenSCAD can be found at http://www.openscad.org/.  The full language reference can be found in the [OpenSCAD User Manual](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language).

## API

`brick()` Renders a 1x1 brick.
`brick_array(X, Y)` Renders an XxY array of bricks.
`brick_map(map)` Render an array of bricks based on the given map.

`dot()` Render a 1x1 dot the height of a board.

`board()` Renders a 1x1 board.
`board_array(X, Y)` Renders an XxY array of boards.
`board_map(map)` Render an array of boards based on the given map.

