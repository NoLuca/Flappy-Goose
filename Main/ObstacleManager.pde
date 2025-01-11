class ObstacleManager{
    ArrayList<Obstacle> obstacles;
    int spawnInterval;

    ObstacleManager(){
        obstacles = new ArrayList<Obstacle>();
        nextSpawn();
    }

    void nextSpawn(){
        spawnInterval = millis() + (int)random(500, 2000);
    }

    void update(boolean isPaused){
        if(isPaused){
            return;
        }

        if(millis() > spawnInterval){
            obstacles.add(new Obstacle());
            nextSpawn();
        }

        for(int i = obstacles.size() - 1; i >= 0; i--){
            Obstacle o = obstacles.get(i);
            o.update();
            //o.draw();

            if(o.getHitBox().intersects(goose.getHitBox())){
                gameOver();
                return;
            }

            if(o.isOffScreen()){
                obstacles.remove(i);
            }
        }

        if(goose.isOffScreen()){
            gameOver();
        }
    }

    void draw(){
        for(Obstacle o : obstacles){
            o.draw();
        }
    }

    void gameOver(){
        fill(255, 0, 0);
        textSize(50);
        textAlign(CENTER, CENTER);
        text("Game Over", width / 2, height / 2);
        noLoop();
    }
}