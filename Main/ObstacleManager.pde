class ObstacleManager{
    private ArrayList<Obstacle> obstacles;
    private int spawnInterval;

    public ObstacleManager(){
        obstacles = new ArrayList<Obstacle>();
        nextSpawn();
    }

    private void nextSpawn(){
        spawnInterval = millis() + (int)random(500, 2000);
    }

    public void update(){
        if(millis() > spawnInterval){
            obstacles.add(new Obstacle());
            nextSpawn();
        }

        for(int i = obstacles.size() - 1; i >= 0; i--){
            Obstacle o = obstacles.get(i);
            o.update();
            o.draw();

            if(o.isOffScreen()){
                obstacles.remove(i);
            }
        }
    }

    public void draw(){
        for(Obstacle o : obstacles){
            o.draw();
        }
    }
}