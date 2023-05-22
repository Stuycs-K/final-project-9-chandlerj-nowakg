
public class LevelRun{
  int level;
  private static final int MENU = 0;
  private static final int DAY = 1;
  private static final int NIGHT = 2;
  private static final int POOL = 3;
  private static final int FOG = 4;
  private static final int ROOF = 5;
  
  
  public LevelRun(int lev){
    level = lev;
  }
  
  public void levelSetup(){
    switch (level){
     case MENU:
     //load menu
       break;
     case DAY:
     // load day
     
     
       break;
     case NIGHT:
     //load menu
       break;
     case POOL:
     // load day
       break;
     case FOG:
     //load menu
       break;
     case ROOF:
     // load day
       break;
      
    }
  }
  
  public void levelRun(){
    
  }
  

}
