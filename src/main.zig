const rl = @import("raylib");
const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn main() anyerror!void {
    // Initialization
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(120); // Set our game to run at 120 frames-per-second

    // Main game loop
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // Update

        // Draw
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.black);

        rl.drawText("wow", screenWidth / 2, 150, 20, .white);

        var i: i32 = 5;
        while (i < 10) : (i += 1) {
            rl.drawCircle(i * 10, screenHeight / 2, 20, .red);
        }
    }
}
