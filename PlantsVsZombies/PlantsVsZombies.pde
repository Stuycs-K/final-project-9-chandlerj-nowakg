  import java.util.*;
  private static final int MENU = 0;
  private static final int DAY = 1;
  private static final int NIGHT = 2;
  private static final int POOL = 3;
  private static final int FOG = 4;
  private static final int ROOF = 5;
  
  Controller userInput;
  
  Level activeLevel;
  int coins = 0;

void enterNextLevel(){
  if (activeLevel.getID() + 1 > 5){
    changeLevel(MENU);
    return;
  }
   changeLevel(activeLevel.getID() + 1); 
}


void changeLevel(int levelID){
  Level newLevel;
  activeLevel.deload();
  
  switch(levelID){
    case(MENU):
      newLevel = new MainMenu();
      break;
    case(DAY):
      newLevel = new DayLevel();
      break;
     case(NIGHT):
      newLevel = new NightLevel();
      break;
     case(POOL):
      newLevel = new PoolLevel();
      break;
    case(FOG):
      newLevel = new FogLevel();
      break;
    case(ROOF):
      newLevel = new RoofLevel();
      break;
    default:
      newLevel = new MainMenu();
      System.out.println("error: levelID greater than 5, or less than 0 in changeLevel() (PlantsvsZombies) ");
  }
  
   activeLevel = newLevel;
   activeLevel.configure();

}


void setup(){
   size(1920, 1040);
   System.out.println("setup:  running level menu."); 
   userInput = new Controller();
   activeLevel = new MainMenu();
   activeLevel.configure();

}

void draw(){
  
  //level stuff
  
  activeLevel.run();
  if (activeLevel.isFinished() == true && activeLevel.getID() != MENU){
     enterNextLevel();  
  }
  

  
}    


//KEY PRESSING AND RELEASING
public void mousePressed(){
  userInput.press(Controller.MOUSECLICK);
}
public void mouseReleased(){
  userInput.release(Controller.MOUSECLICK);
}
