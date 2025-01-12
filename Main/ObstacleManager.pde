class ObstacleManager{
    ArrayList<Obstacle> obstacles;
    int spawnInterval;

    ObstacleManager(){
        obstacles = new ArrayList<Obstacle>();
        nextSpawn();
    }

    void nextSpawn(){
        spawnInterval = millis() + (int)random(150, 1000);
    }

    boolean update(boolean isPaused){
        if(isPaused){
            return false;
        }

        if(millis() > spawnInterval){
            obstacles.add(new Obstacle());
            nextSpawn();
        }

        for(int i = obstacles.size() - 1; i >= 0; i--){
            Obstacle o = obstacles.get(i);
            o.update();

            if(o.getHitBox().intersects(goose.getHitBox())){
                return gameOver();
            }

            if(o.isOffScreen()){
                obstacles.remove(i);
            }
        }

        if(goose.isOffScreen()){
            return gameOver();
        }
        
        return false;
    }

    void draw(){
        for(Obstacle o : obstacles){
            o.draw();
        }
    }

    boolean gameOver(){
        return true;
    }
}
