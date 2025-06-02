const rl = @import("raylib");
const std = @import("std");

pub fn main() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "Gooner ball..");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    // Ball state
    var position = rl.Vector2{ .x = 400.0, .y = 100.0 };
    var velocity = rl.Vector2{ .x = 200.0, .y = 0.0 }; // pixels/sec
    const gravity: f32 = 500.0; // pixels/sec^2
    const radius: f32 = 20.0;
    const damping: f32 = 0.8;

    while (!rl.windowShouldClose()) {
        const dt = rl.getFrameTime();

        velocity.y += gravity * dt;
        position.x += velocity.x * dt;
        position.y += velocity.y * dt;

        // floor and wall check
        if (position.y + radius >= @as(f32, screenHeight)) {
            position.y = screenHeight - radius;
            velocity.y *= -damping;
        } else if (position.y - radius <= 0) {
            position.y = radius;
            velocity.y *= -damping;
        }

        // wall check
        if (position.x + radius >= @as(f32, screenWidth)) {
            position.x = screenWidth - radius;
            velocity.x *= -damping;
        } else if (position.x - radius <= 0) {
            position.x = radius;
            velocity.x *= -damping;
        }

        // render
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.black);
        rl.drawText("Boingo Oingo", 10, 10, 20, rl.Color.white);
        rl.drawCircleV(position, radius, rl.Color.pink);
    }
}
