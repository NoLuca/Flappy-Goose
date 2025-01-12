PImage image;
Goose goose;
Pause pause;
ObstacleManager manager;
boolean countdownActive = false; 
int countdown = 3; 
int countdownStartTime;

int survivalTime = 0;
int lastTimeUpdate = 0;
boolean gameOver = false;

void setup(){
  size(640, 640);
  manager = new ObstacleManager();
  goose = new Goose();
  pause = new Pause(goose);
  image = loadImage("background.png");
}

void draw(){  
  background(image);

  if(!countdownActive){
    gameOver = manager.update(pause.isPaused());
    
    if (!pause.isPaused() && millis() - lastTimeUpdate >= 1000) {
      survivalTime++;
      lastTimeUpdate = millis();
    }

      manager.draw();
      goose.draw();
      pause.draw();

    if(gameOver){
      background(image);
      fill(255, 255, 255);
      textSize(50);
      textAlign(CENTER, CENTER);
      text(survivalTime + "s", width / 2, height / 2 + 50);
      
      fill(255, 0, 0);
      textSize(50);
      textAlign(CENTER, CENTER);
      text("Game Over", width / 2, height / 2);
      if(survivalTime < 30){
        textSize(50);
        textAlign(CENTER, CENTER);
        text(")-:", width / 2, height / 2 + 100);
      }else{
        fill(0, 255, 0);
        textSize(50);
        textAlign(CENTER, CENTER);
        text("(-:", width / 2, height / 2 + 100);
      }
      noLoop();
    }

    
  }else{
    int elapsed = (millis() - countdownStartTime) / 1000;
    int timeLeft = countdown - elapsed; 

    if(timeLeft > 0){
      fill(255);
      textSize(32);
      textAlign(CENTER, CENTER);
      text("Riprende in: " + timeLeft, width / 2, height / 2);
    }else{
      countdownActive = false;
      pause.resume();
    }
  }
}

void mousePressed(){ 
  if(pause.isClicked(mouseX, mouseY)){
    if(pause.isPaused()){      
      countdownActive = true;
      countdownStartTime = millis();
    }else{
      pause.mouseClicked();
    }
  }
}

void keyPressed(){
  if(key == ' '){
    goose.flap();
  }
}
