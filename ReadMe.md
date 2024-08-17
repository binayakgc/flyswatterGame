The file contains code for a fly-swatting game written in Processing. Here's an overview:

Description:
Author: Kabir G C
Objective: The goal is to create a game where the player swats flies using a swatter. When a fly is hit, it changes into a "dead fly" image, and the player scores points. The game ends when the player swats a total of 30 flies.
Key Features:
Fly and Swatter Images: There are images for live flies, dead flies, and the swatter.
Score System: The player's score increases when a fly is swatted. The maximum score is 30.
Fly Persistence: After a fly is swatted, its image remains on screen for 10 seconds before disappearing.
Winning Condition: If the player reaches the maximum score of 30, a message "You won!" is displayed, and the game stops.
Main Components:
Images: Flies and swatter are loaded and resized.
Fly Spawning: Flies are randomly spawned across the screen.
Collision Detection: The game checks if the swatter collides with a fly, and if so, marks the fly as swatted and increments the score.
User Input: Mouse clicks are used to swat flies.
Functions:
setup(): Initializes the game, loading images and setting initial values.
populate(): Draws flies and dead fly images on the screen.
collisionDetect(): Detects collisions between the swatter and flies, handling swatting logic.
draw(): Updates the screen, displays the swatter, flies, and score. It also checks if the player has won.
mousePressed() / mouseReleased(): Handles mouse input to detect swatting actions.
