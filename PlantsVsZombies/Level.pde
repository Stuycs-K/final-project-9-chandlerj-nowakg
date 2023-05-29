  import java.util.Random; 
  public class Level{
  int levelID;
  PImage background;
  boolean finished = false;
  int sun;
  boolean isDay;
  Lawn lawn;
  Random seed;

  //TO BE DONE: incorporate music into each level
  //TO BE DONE: 

 
  
  public Level(int id, PImage b){
    this(id, b, new Lawn(new int[1][1]));
  }
  
  public Level(int id, PImage b, Lawn l){
    this(id, b, l, false);
  }
  
  public Level(int id, PImage b, Lawn l, boolean d){
    this(id, b, l, d, new Random());
  }
  
  public Level(int id, PImage b, Lawn l, boolean d, Random sd){
    seed = sd;
    levelID = id;
    background = b;
    lawn = l;
    isDay = d;
  }
  
  
  public void configure(){
    image(background,0,0);
    background.resize(1920,1040);
    sun = 0;
    
  }
  
  public void run(){
    if (isDay){
     generateSun(); 
    }
    //tell zombies to move
    //tell plants to fire
   
  }
  
  public void win(){
    
    //this method stops zombie spawns and stops firing plants and puts the end reward (coins)
    //if (win), 
    deload();
    
  }
   
  public void deload(){
   finished = true;
   //get rid of all sun objects
   //get rid of all coins
   //get rid of all zombies and plants
   //
  }
  
  public void generateSun(){
    // will generate sun at a semi random rate 
    // if seed mod 10 is like 3 or something
  }
  
  public void mouseClicked(){
    System.out.println("this method is not getting overridden");
  }
  
  
  
  public boolean isFinished(){
    return finished;
  }
  
  public int getID(){
   return levelID; 
  }

}
