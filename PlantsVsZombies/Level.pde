
public class Level{
  int levelID;
  PImage background;
  int stage;
  boolean finished = false;
  int sun;
  boolean isDay;
  
  
  
  //TO BE DONE: incorporate music into each level
  //TO BE DONE: 
  
  public Level(int id, PImage b){
    this(id, b, 0);
  }
  
  public Level(int id, PImage b, int s){
    levelID = id;
    background = b;
    stage = s;
  }
  
  public void configure(){
    image(background,0,0);
  }
  
  public void run(){

  }
  
  public void win(){
    
    
    //if (win)
    deload();
  }
   
  public void deload(){
   finished = true;
  }
  
  public boolean isFinished(){
    return finished;
  }
  
  public int getID(){
   return levelID; 
  }

}
