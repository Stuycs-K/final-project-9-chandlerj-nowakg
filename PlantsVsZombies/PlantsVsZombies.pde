LevelRun currentLevel;



void setup(){
  
  size(1800, 1800);
  
  
 System.out.println("setup:  running level 1."); 
 currentLevel = new LevelRun(1);
 currentLevel.levelSetup();
}

void draw(){
  currentLevel.levelRun();
}    
