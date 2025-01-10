Goose goose;
Pause pause;
boolean countdownActive = false; 
int countdown = 3; 
int countdownStartTime;

void setup() {
  size(640, 640);
  goose = new Goose();
  pause = new Pause(goose);
}

void draw() {
  
  background(0);

  if (countdownActive) {
    
    int elapsed = (millis() - countdownStartTime) / 1000;
    int timeLeft = countdown - elapsed;

    if (timeLeft > 0) {
      fill(255);
      textSize(32);
      textAlign(CENTER, CENTER);
      text("Riprende in: " + timeLeft, width / 2, height / 2);
    } else {
      countdownActive = false;
      pause.resume();
    }
  } else {
   
    goose.draw();
    pause.draw();
  }
}

void mousePressed() {
 
  if (pause.isClicked(mouseX, mouseY)) {
    if (pause.isPaused()) {
      
      countdownActive = true;
      countdownStartTime = millis();
    } else {
      pause.mouseClicked();
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    goose.flap();
  }
}