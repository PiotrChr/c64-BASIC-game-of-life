# C64 Game of Life

This BASIC program runs Conway's Game of Life on a Commodore 64 computer, featuring a dynamic loading bar that visually indicates progress during each simulation cycle. The user can define the grid size, and the program will initialize and update the grid according to the rules of Conway's Game of Life, displaying a loading bar that progresses with each iteration.

## Prerequisites

To run this program, you need:
- A Commodore 64 or a compatible emulator
- Basic understanding of how to input and run BASIC programs on the C64

## Running the Program

1. **Start your Commodore 64 or emulator.**
2. **Enter the BASIC code line by line.**
3. **Run the program by typing `RUN` and pressing enter.**

The program will first prompt you to enter the width and height of the grid. The maximum allowable width is 40, and the maximum height is 25.

## Features

- **Grid Size Customization:** Users can specify the grid dimensions within the constraints.
- **Dynamic Grid Initialization:** Each cell in the grid is initially set to either alive or dead randomly.
- **Simulation:** The game iteratively updates the grid based on the Game of Life rules:
  - Any live cell with two or three live neighbours survives.
  - Any dead cell with exactly three live neighbours becomes a live cell.
  - All other live cells die in the next generation. Similarly, all other dead cells stay dead.

## Technical Details

- **Display:** Uses the C64's screen memory starting from address 1024 for displaying the grid.
- **Performance:** Manages computational load by limiting iterations and dynamically adjusting the refresh rate based on grid size.
- **Memory Management:** Uses two arrays `a` and `b` to hold the current and next states of the grid, ensuring smooth transitions.

## Custom Header Display

The program includes a custom header display mechanism that places a title "c64 game of life" at the top of the screen using the `POKE` command to directly manipulate screen memory.

## Note

Be mindful of the grid size and performance limitations of the C64 when setting parameters. Larger grids may slow down the simulation considerably.
