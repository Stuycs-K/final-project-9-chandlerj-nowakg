
public class Level{
  int levelID;
  PImage background;
  int stage;
  boolean finished = false;
  int sun;
  boolean isDay;
  Lawn lawn;
  
  
  
  //TO BE DONE: incorporate music into each level
  //TO BE DONE: 
  
  public Level(int id, PImage b){
    this(id, b, new Lawn(new int[1][1]));
  }
  
  public Level(int id, PImage b, Lawn l){
    levelID = id;
    background = b;
    lawn = l;
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
