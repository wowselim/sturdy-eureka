const std = @import("std");
const r = @cImport({
    @cInclude("raylib.h");
});

pub fn main() !void {
    const width: i32 = 640;
    const height: i32 = 480;

    r.SetTargetFPS(60);
    r.InitWindow(width, height, "Zig + Raylib");
    defer r.CloseWindow();

    const font = r.LoadFont("assets/Monocraft.otf");
    defer r.UnloadFont(font);

    var position = r.Vector2{ .x = 100.0, .y = 100.0 };

    while (!r.WindowShouldClose()) {
        if (r.IsKeyDown(r.KEY_RIGHT)) position.x += 2;
        if (r.IsKeyDown(r.KEY_LEFT)) position.x -= 2;
        if (r.IsKeyDown(r.KEY_UP)) position.y -= 2;
        if (r.IsKeyDown(r.KEY_DOWN)) position.y += 2;
        if (r.IsMouseButtonDown(0)) {
            position = r.GetMousePosition();
        }

        r.BeginDrawing();
        defer r.EndDrawing();
        r.ClearBackground(r.WHITE);
        r.DrawFPS(10, 10);
        r.DrawTextEx(font, "Hello", position, 48, 0, r.DARKGRAY);
    }
}
