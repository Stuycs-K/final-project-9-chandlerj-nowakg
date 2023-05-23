
public class Level{
  int levelID;
  PImage background;
  int stage;
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
    
  }
   
  public void deload(){
    
  }
  
  public int getID(){
   return levelID; 
  }

}
