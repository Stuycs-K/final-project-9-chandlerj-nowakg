LevelRun currentLevel;
PImage lawn;


void setup(){
  lawn = loadImage("Sprites/Frontyard.jpg");
  size(1800, 1800);
  image(lawn,0,0);
  
 System.out.println("setup:  running level 1."); 
 currentLevel = new LevelRun(1);
 currentLevel.levelSetup();
}

void draw(){
  currentLevel.levelRun();
}    
