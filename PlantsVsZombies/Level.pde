import java.util.*;
public class Level extends World{
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
  Camera cam;
  DebugCamera debugCam;
  
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
    super(b.pixelWidth, b.pixelHeight, b); //the SCREEN SIZE is 1920 by 1040. the GAME AREA is going to be whatever the background's pixels are (day has 3000 by 1040)
    seed = sd;
    levelID = id;
    background = b;
    lawn = l;
    isDay = d;
    sun = 0;
  }
  
  
  public void prepare(){
    //camera stuff
    cam = new Camera();
    //debugCam = new DebugCamera();
    setCamFollowActor(cam);
    setUnbounded(true);
    cam.setX(width/2);
    System.out.println("hello");
    
      
    //seedSlots.resize(940,130);
    //image(seedSlots,180,0);
    //image(seedSelect, 300, 300);
    
    gameState = INVASION;
    //gameState = INVASION; //for testing purposes

    
  }
  
  public void act(float deltaTime){  
    if (gameState == SEEDSELECTION){
      
      //this is just for testing purposes
      
      
    }
    
    if (gameState == INVASION){
      cam.setX(1300);
      //tell zombies to move
      //tell plants to fire
      
      
    }
    
    if (gameState == REWARD){
      
      //spawn a moneybag
      //when the money bag is clicked... 
          //enter the coins (cool animation maybe)
      finished = true;
    }
    
    if (green.isMouseButtonDown(LEFT)){
     // spawnCoin(mouseX, mouseY, Collectable.SILVERCOIN);
      lawn.placePlant("Peashooter", mouseX, mouseY, true);
     }
     if (green.isMouseButtonDown(RIGHT)){
    //  generateSun(mouseX, mouseY, false, seed); 
         System.out.println(" " + mouseX + " ");
     }
    
   
  }



  
  
  public boolean isFinished(){
    return finished;
  }
  
  public int getID(){
   return levelID; 
  }
  
  public Random getSeed(){
   return seed; 
  }
  
  ///COLLECTABLE STUFF VVVVVVVVVVVVVVV //////////////////////////
  

  
  public void spawnCoin(float x, float y, int type){
    Collectable collectable;
    
    switch (type){
      case Collectable.SILVERCOIN:
        collectable = new SilverCoin(x, y);
        break;
      case Collectable.GOLDCOIN:
        collectable = new GoldCoin(x,y);
        break;
      case Collectable.DIAMOND:
        collectable = new Diamond(x,y);
        break;
      case Collectable.MONEYBAG:
        collectable = new MoneyBag(x,y,250);
        break;
      default:
        collectable = new MoneyBag(x,y, 0); 
        System.out.println("error: spawnCoin() tried spawning a coin with NO TYPE PARAMETER");
        break;
    }
    collectable.spawn();
  }
  
  public void generateSkySun(){
   generateSun(seed.nextInt(width), -10, true, seed); 
  }
  
  public void generateSun(float x, float y, boolean fromSky, Random seed){
    x += seed.nextInt(10); //so there's a little variation on where it spawns from the sky and from the plant 
    Collectable sun = new Sun(x, y, fromSky, seed);
    sun.spawn();
  }
  
  
  
  //COLLECTABLE STUFF ^^^^^^^^^^^ /////////////////////////
  
  


  

} //END OF LEVEL CLASS

//DIFFERENT INSTANCES OF LEVEL  (SO WE DONT HAVE 9000 FILES)


public class DayLevel extends Level{
 public DayLevel(){
    super(1, loadImage("Sprites/Frontyard.png"), 
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
