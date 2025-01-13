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

    public void setCountdown(int countdown) {
        this.countdown = countdown;
    }

    public void setCountdownActive(boolean countdownActive) {
        this.countdownActive = countdownActive;
    }

    public void setCountdownStartTime(int countdownStartTime) {
        this.countdownStartTime = countdownStartTime;
    }

    public void setGameOver(boolean gameOver) {
        this.gameOver = gameOver;
    }

    public void setGoose(Goose goose) {
        this.goose = goose;
    }

    public void setImage(PImage image) {
        this.image = image;
    }

    public void setLastTimeUpdate(int lastTimeUpdate) {
        this.lastTimeUpdate = lastTimeUpdate;
    }

    public void setManager(ObstacleManager manager) {
        this.manager = manager;
    }

    public void setPause(Pause pause) {
        this.pause = pause;
    }

    public void setSurvivalTime(int survivalTime) {
        this.survivalTime = survivalTime;
    }

    

    public int getCountdown() {
        return countdown;
    }

    

    public Goose getGoose() {
        return goose;
    }

    public int getCountdownStartTime() {
        return countdownStartTime;
    }

    public PImage getImage() {
      return image;
    }

    public int getSurvivalTime() {
      return survivalTime;
    }

    public Pause getPause() {
      return pause;
    }

    public int getLastTimeUpdate() {
      return lastTimeUpdate;
    }
    
    public ObstacleManager getManager() {
      return manager;
    }

void draw(){  
  background(getImage());

  if(!countdownActive){
    setGameOver(getManager().update(getPause().isPaused()));
    
    if (!getPause().isPaused() && millis() - getLastTimeUpdate() >= 1000) {
      setSurvivalTime(getSurvivalTime()+1);
      setLastTimeUpdate( millis());
    }

      getManager().draw();
      getGoose().draw();
      getPause().draw();

    if(gameOver){
      background(getImage());
      fill(255, 255, 255);
      textSize(50);
      textAlign(CENTER, CENTER);
      text(getSurvivalTime() + "s", width / 2, height / 2 + 50);
      
      fill(255, 0, 0);
      textSize(50);
      textAlign(CENTER, CENTER);
      text("Game Over", width / 2, height / 2);
      if(getSurvivalTime() < 30){
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
    int elapsed = (millis() - getCountdownStartTime()) / 1000;
    int timeLeft = getCountdown() - elapsed; 

    if(timeLeft > 0){
      fill(255);
      textSize(32);
      textAlign(CENTER, CENTER);
      text("Riprende in: " + timeLeft, width / 2, height / 2);
    }else{
      countdownActive = false;
      getPause().resume();
    }
  }
}

void mousePressed(){ 
  if(getPause().isClicked(mouseX, mouseY)){
    if(getPause().isPaused()){      
      countdownActive = true;
      setCountdownStartTime(millis());
    }else{
      getPause().mouseClicked();
    }
  }
}

void keyPressed(){
  if(key == ' '){
    getGoose().flap();
  }
}
