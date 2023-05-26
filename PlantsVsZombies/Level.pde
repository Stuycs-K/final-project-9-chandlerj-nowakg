import java.util.*;
public class Level{
  static final int  SUN = 0;
  static final int  COIN = 1;
  
  
  int levelID;
  PImage background;
  PImage seedSelect = loadImage("Sprites/seedselect.jpg");
  PImage seedSlots = loadImage("Sprites/seedslots.jpg");
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
    background.resize(3100,1040);
    image(background, -300,10);  
    sun = 0;
    
    gameState = SEEDSELECTION;
  }
  
  public void run(){
    mouseInput();
    if (gameState == SEEDSELECTION){
      seedSlots.resize(940,130);
      image(seedSlots,180,0);
      image(seedSelect, 300, 300);
      //this is just for testing purposes
      Collectable coin = new Coin(seed, seedSlots);
      coin.spawn(800, 800, 200);
      
      
    }
    
    if (gameState == INVASION){
      if (isDay){

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

  
  public void mouseInput(){
    System.out.println("this method is not getting overridden");
  }
  
  
  
  public boolean isFinished(){
    return finished;
  }
  
  public int getID(){
   return levelID; 
  }
  
  ///COLLECTABLE STUFF VVVV //////////////////////////
  

  
  
  
  
  
  
  
  
  
  //COLLECTABLE STUFF ^^^^^^^^^^^ /////////////////////////
  
  
  
  
  

}
