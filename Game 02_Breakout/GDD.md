# Breakout Game Design Document

## Game Overview
- Title: Breakout
- Genre: single-player arcade
- Core Concept: bounce a ball off a moveable paddle to hit bricks and get points per brick hit
- Platform: PC
- Target Audience: OP learning

## Game Flow
- Start Screen: select start or quit; display high score to beat
- Play
- Win/loss
- Restart

## Gameplay
- Move paddle to hit ball
- Make ball bounce to hit bricks
- Destroy as many bricks as you can
- Aim for specific colours or power-ups to increase score
- Go for as long as you can to achieve the highest score possible

## Mechanics
- Paddle player input
- Ball physics
- Brick breaking
- Score keeping
- Win/Loss conditions
- Difficulty increase over time
- Game pausing

## Controls
- x-axis paddle movement only

## Art & Aesthetics
- Simple pixel art assets
- Colourful: ROYGBIV
### Sprites Needed
- Paddle
- Ball
- Bricks:
    - Red
    - Yellow
    - Blue
    - Green
- Backgrounds:
    - Level 1
    - Level 2

## Audio
- Paddle hit
- Brick explosion
- Power up
- Background music

## User Interface
- Start menu
- Paddle controls input
- Escape menu

## Features
- Paddle control
- Brick destruction
- Power ups:
    - Paddle enlargement
    - Ball enlargement
    - Multi-ball
- Score combos
- Levels
- Player lives
- Recorded high score

## Technical Notes
### Scene Structure
- Game
    - UI
        - ScoreLabel
        - LivesLabel
    - Paddle
    - Ball
    - Level
        - Individual Bricks
    - LevelLoader
 ### General Strategy
- Use Tilemap for brick layout per level
- LevelManager.gd script needed for LevelLoader
- Use Autoloads to manage global state data like score, lives, current level

## Development Roadmap
- Sprite asset creation
- Audio selection
- Ball physics
- Paddle player input
- Brick destruction animation
- Power ups
- Score tracking
- Win/Loss conditions
- Level 2