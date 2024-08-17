/*
 Author Name: Kabir G C 
 
 Objective: This code is used to create a game where there are flies and a swatter.
 When swatter hit the flies then image of dead flies appear and give user a score and the max score they can get is 30.
 as an additional feature, when the deadfly image appears it stays in that place for around 10 seconds and it disappears.
 So, it bascially fly swatter game.
*/


import processing.core.*;

PImage fly, flybye, swatter, swatted;
float[] fX, fY; // fly locations array
boolean[] swat; // fly swatted boolean array, true = swatted, false = not swatted
int score = 0; // increments when swatted
int maxFlies = 30; // Maximum number of flies to spawn
int currentFly = 0; // Index of the current live fly
long[] swatTimes; // Array to store the time when each fly was swatted
boolean mousePressed = false; // Flag to track mouse button state

void setup() {
    size(800, 400);
    fX = new float[maxFlies];
    fY = new float[maxFlies];
    swat = new boolean[maxFlies];
    swatTimes = new long[maxFlies]; // Initialize swatTimes array

    // Load images
    fly = loadImage("fly.png");
    fly.resize(70, 70);
    flybye = loadImage("flybye.png"); // Assuming separate image for live fly
    flybye.resize(70, 70);
    swatter = loadImage("swatter.png");
    swatted = loadImage("swatted.png");

    // Add the first fly at a random location
    fX[currentFly] = random(width);
    fY[currentFly] = random(height);
    swat[currentFly] = false; // Initially, the fly is not swatted
}

void populate() {
    for (int i = 0; i < maxFlies; i++) {
        if (i == currentFly && !swat[i]) {
            image(fly, fX[i], fY[i]); // Draw live fly image
        } else if (swat[i] && millis() - swatTimes[i] < 10000) { // 10000 milliseconds = 10 seconds
            image(flybye, fX[i], fY[i]); // Draw flybye image at the collision location
        }
    }
}

void collisionDetect() {
    // Check for collision only when the mouse button is pressed
    if (mousePressed) {
        // Check for collision using bounding box (adjust tolerances as needed)
        if (!swat[currentFly] && mouseX > fX[currentFly] - swatter.width / 2 &&
            mouseX < fX[currentFly] + fly.width / 2 &&
            mouseY > fY[currentFly] - swatter.height / 2 &&
            mouseY < fY[currentFly] + fly.height / 2) {
            swat[currentFly] = true; // Mark fly as swatted
            swatTimes[currentFly] = millis(); // Store the time when the fly was swatted
            score++; // Increment score

            // Spawn the next fly if there are more to spawn
            if (currentFly < maxFlies - 1) {
                currentFly++;
                fX[currentFly] = random(width / 1.2);
                fY[currentFly] = random(height / 1.5);
                swat[currentFly] = false;
            }
        }
        mousePressed = false; // Reset the mousePressed flag
    }
}

void draw() {
    background(255);
    populate(); // Draw flies to screen

    // Update swatter position based on mouse coordinates
    image(swatter, mouseX - swatter.width / 50, mouseY - swatter.height / 50);

    // Display score
    fill(0);
    textSize(32);
    text("Score: " + score, 10, 30);

    if (score == maxFlies) {
        textSize(48);
        text("You won!", width / 2 - 100, height / 2);
        noLoop(); // Stop the draw loop
    } else {
        collisionDetect(); // Check for collision if not all flies swatted
    }
}

void mousePressed() {
    mousePressed = true; // Set the mousePressed flag when the mouse button is pressed
}

void mouseReleased() {
    mousePressed = false; // Reset the mousePressed flag when the mouse button is released
}
