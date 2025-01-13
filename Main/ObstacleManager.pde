class ObstacleManager{
    ArrayList<Obstacle> obstacles;
    int spawnInterval;

    public ArrayList<Obstacle> getObstacles() {
        return obstacles;
    }

    public int getSpawnInterval() {
        return spawnInterval;
    }

    public void setObstacles(ArrayList<Obstacle> obstacles) {
        this.obstacles = obstacles;
    }

    public void setSpawnInterval(int spawnInterval) {
        this.spawnInterval = spawnInterval;
    }
    
    

    ObstacleManager(){
        obstacles = new ArrayList<Obstacle>();
        nextSpawn();
    }

    void nextSpawn(){
        setSpawnInterval( millis() + (int)random(150, 1000));
    }

    boolean update(boolean isPaused){
        if(isPaused){
            return false;
        }

        if(millis() > spawnInterval){
           getObstacles().add(new Obstacle());
            nextSpawn();
        }

        for(int i = obstacles.size() - 1; i >= 0; i--){
            Obstacle supportObstacles = getObstacles().get(i);
            supportObstacles.update();

            if(supportObstacles.getHitBox().intersects(goose.getHitBox())){
                return gameOver();
            }

            if(supportObstacles.isOffScreen()){
                obstacles.remove(i);
            }
        }

        if(goose.isOffScreen()){
            return gameOver();
        }
        
        return false;
    }

    void draw(){
        for(Obstacle supportObstacles : obstacles){
            supportObstacles.draw();
        }
    }

    boolean gameOver(){
        return true;
    }
}
