  import java.util.Random;
  
  public class Level{
  int levelID;
  PImage background;
  PImage seedSelect = loadImage("Sprites/seedselect.jpg");
  boolean finished = false;
  int sun;
  boolean isDay;
  Lawn lawn;
  Random seed;
  int gameState;
  
  private static final int SEEDSELECTION = 0;
  private static final int INVASION = 1; 
  private static final int REWARD = 2;

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
    background.resize(1920,1040);
    image(background,0,0);
    sun = 0;
    
    gameState = SEEDSELECTION;
  }
  
  public void run(){
    
    if (gameState == SEEDSELECTION){
      image(seedSelect, 100, 20);
    }
    
    if (gameState == INVASION){
      if (isDay){
       generateSun(); 
      }
      //tell zombies to move
      //tell plants to fire
    }
    
    if (gameState == REWARD){
      
    }
    
    
    
   
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
