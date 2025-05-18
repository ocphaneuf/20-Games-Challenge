# Game 01 - Pong Clone

## Summary
Basic pong clone with 1P input and an AI opponent. Developed in Godot 4.3.

## Goals:
- [x] Create an arena with two walls and a divider.
- [x] Add a paddle on either end of the play field. Use player inputs to move the paddles up and down.
- [x] Add a ball that moves around the playfield and bounces off of the paddles and walls.
- [x] Detect when the ball leaves the playfield. Assign a point to the player who scored.
- [] Track and display the score for each player.

## Stretch goals:
- [x] Write an AI script that can follow the ball so you can play with only one player.
- [] Hint: Following the ball with a paddle is easy, but it makes the opponent impossible to beat. You might want to make the AI less than perfect somehow.
- [] Add a menu and allow the player to reset the game.
- [x] Add some basic sounds. Play a sound every time the ball collides with something, and every time a player scores.

## What I Learned:
- Make sure the tutorials you watch are using the same version of the engine you're using (Tutorial using Godot 3 while I use updated Godot 4 with different phyiscs systems and syntax)
- Godot comes with built-in features to program movement, e.g. the animationplayer node can define a looping movement of a static body rather than hardcoding it
- Godot is all about building modular scenes to then use in the main game's scene tree
- Don't forget to attach the right scripts to the right scenes in the main tree
- Creating & assigning signals will create relevant functions in scene scripts
- exporting variables is really useful to make them quickly editable in node inspectors
- Godot has built-in shape creators rather than me having to create rectangles to pixel-perfect size in MSPaint
- To call a different script's function within another script, call node/script.function
- To update a variable from one script to a different script, call node/script.variable = new state
- Each node has a "process" setting in the inspector. If you want to pause the game, make sure you have each node in the tree set to "pausable" that you want to not have processes running for, and likely the main game node and any background processing nodes set to always. You'll want the Esc Menu node set to always so it can be unpaused

## What I'd Improve Next Time
- Simpler code
- Smoother AI movement
- Paddle and Ball sprites made in Godot
- Better and more appropriate sounds
