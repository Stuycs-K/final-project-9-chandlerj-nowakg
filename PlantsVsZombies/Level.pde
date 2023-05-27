import java.util.*;
public class Level{
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
  public List<Collectable> collectables = new ArrayList();
  
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
    
    //gameState = SEEDSELECTION;
    gameState = INVASION; //for testing purposes
  }
  
  public void run(){
    mouseInput();
    if (gameState == SEEDSELECTION){
      seedSlots.resize(940,130);
      image(seedSlots,180,0);
      image(seedSelect, 300, 300);
      //this is just for testing purposes
      
      spawnCollectable(500, 500, Collectable.SUN);
      
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
    
    //this method stops zombie spawns and stops firing plants and puts the end reward (moneybag)
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
  
  ///COLLECTABLE STUFF VVVVVVVVVVVVVVV //////////////////////////
  

  
  public void spawnCoin(int x, int y, int type){
    Collectable collectable = new Collectable(seedSlots);
    
    switch (type){
      case Collectable.SILVERCOIN:
        collectable = new SilverCoin();
        break;
      case Collectable.GOLDCOIN:
        collectable = new GoldCoin();
        break;
      case Collectable.DIAMOND:
        collectable = new Diamond();
        break;
      case Collectable.MONEYBAG:
        collectable = new MoneyBag();
        break;          
    }
    collectables.add(collectable);
    collectable.spawn(x, y, 100);
  }
  
  public void generateSun(int x, int y, boolean fromSky){
    Collectable sun = new Sun(fromSky);
    collectables.add(sun);
    if (fromSky){
      sun.spawn(seed.nextInt(width/2), -10, 100);
    }
    else{
     sun.spawn(x + seed.nextInt(10), y, 100); 
    }
    


        

    
  }
  
  
  
  //COLLECTABLE STUFF ^^^^^^^^^^^ /////////////////////////
  
  


  

} //END OF LEVEL CLASS

//DIFFERENT INSTANCES OF LEVEL  (SO WE DONT HAVE 9000 FILES)


public class DayLevel extends Level{
 public DayLevel(){
    super(1, loadImage("Sprites/Frontyard.jpg"), 
    new Lawn(
    new int[][]{
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL}
    })
    );
 }
}
public class NightLevel extends Level{
  public NightLevel(){
   super(2, loadImage("Sprites/main_menu_background.jpg"), 
   new Lawn (new int[][]{
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL}
    })
    
    );
 }
  
}
  
public class PoolLevel extends Level{
  public PoolLevel(){
   super(3, loadImage("Sprites/main_menu_background.jpg"), new Lawn(new int[][]{
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,WATER,WATER,WATER,WATER,WATER,WATER,WATER,WATER,WATER},
      {MOWER,WATER,WATER,WATER,WATER,WATER,WATER,WATER,WATER,WATER},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL}
    })
    );
 }
}

public class FogLevel extends Level{
  public FogLevel(){
   super(4, loadImage("Sprites/main_menu_background.jpg"), 
   new Lawn (new int[][]{
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,WATER,WATER,WATER,WATER,WATER,WATER,WATER,WATER,WATER},
      {MOWER,WATER,WATER,WATER,WATER,WATER,WATER,WATER,WATER,WATER},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL}
    })
    );
 }
  
}
  
public class RoofLevel extends Level{
  public RoofLevel(){
    super(5, loadImage("Sprites/main_menu_background.jpg"), 
    new Lawn(new int[][]{
      {MOWER,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE},
      {MOWER,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE},
      {MOWER,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE},  
      {MOWER,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE},
      {MOWER,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE,ROOFTILE},
    })
    );
 }
  
}  
