import java.util.*;
public class Level extends World{
  int levelID;
  PImage background;
  //PImage seedSelect = loadImage("Sprites/seedselect.jpg");
  boolean finished = false;
  int sun;
  boolean isDay;
  Lawn lawn;
  Random seed;
  int gameState;
  Camera cam;
  DebugCamera debugCam;
  
  boolean oneSlotSelected = false; //a little wonky solution to the multiple seed selection bug but whatever
  
  
  SeedUI seedUI;
  
  final int[] seedSelectPlacement = {200, 200};
  
  
  public Projectile[] projectileTemplates = {new Pea(), new IcePea(), new FirePea()}; //they won't ALL Be pea but you get the idea
  
    public ArrayList <SeedSlot> selectedSeeds;
  
  private static final int SEEDSELECTION = 0;
  private static final int INVASION = 1; 
  private static final int REWARD = 2;
  private static final int DEFEAT = 3;


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
    sun = 50;
  }
  
  
  public void prepare(){
    //camera stuff
    cam = new Camera();
   // debugCam = new DebugCamera();
    setCamFollowActor(cam);
    setUnbounded(true);
    cam.setX(width/2);
    addObject(cam);
    selectedSeeds = new ArrayList<SeedSlot>(9);
    
    seedUI = new SeedUI();
    addObject(seedUI);
    loadSeedSelection();
    
    gameState = SEEDSELECTION;
    //gameState = INVASION; //for testing purposes

    
  }
  
  
  public void invasion(){ //this can get overrided to change the way the waves get thrown at the player
    if (green.isKeyDown('s')){
      generateSun(mouseX, 0, true, seed);
      }
      if (green.isKeyDown('c')){
        spawnCoin(mouseX, mouseY, Collectable.SILVERCOIN);
      }
      
     List<Zombie> zomList = getObjects(Zombie.class);
    for(int i=0; i < zomList.size(); i++){
      if(zomList.get(i).getX() < 100){
       gameState = DEFEAT;
      }
    }
    if (green.isMouseButtonDown(RIGHT)){
      //generateSun(mouseX, mouseY, false, seed); 
        spawnZombie("regular", seed.nextInt(5));
        System.out.println("" + mouseX + " " + mouseY);
     }
     
     
  }
  
  
  public void act(float deltaTime){  
    textSize(64);
    fill(0);
    text("" + sun, 222, 64);
    
    switch (gameState){
      case SEEDSELECTION:
       
        if (green.isKeyDown(ENTER)){     
          deloadSeedSelection();        
         gameState = INVASION;  
         seedUI.load(selectedSeeds);
        }
        break;
      
      case INVASION:
        lawn.gameState = INVASION;
        invasion();
        break;
        
      case REWARD:
        //to be implemented
        finished = true;
        break;
        
       case DEFEAT:
         this.background = loadImage("Sprites/GameOver.png");
         break;
       
       default:
         System.out.println("error, bad gameState");
         break;
        
    }    
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
    addObject(collectable); 
  }
  
  public void generateSkySun(){
   generateSun(seed.nextInt(width), -10, true, seed); 
  }
  
  public void generateSun(float x, float y, boolean fromSky, Random seed){
    x += seed.nextInt(10); //so there's a little variation on where it spawns from the sky and from the plant 
    Collectable sun = new Sun(x, y, fromSky, seed);
    addObject(sun);
  }
  
  
  
  //COLLECTABLE STUFF ^^^^^^^^^^^ /////////////////////////
  
  //ZOMBIE STUFF VVVVVVV /////
  
  public void spawnZombie(String name, int row){
    int rowThickness = (bottomRightCoord[1] - topLeftCoord[1]) / lawn.lawn.length;
    Zombie zombie = new Regular(rowThickness * row + topLeftCoord[1] + lawn.tileYSize * 0.4);
    addObject(zombie);
  }
  
  //ZOMBIE STUFF ^^^^^^ ///////


 //LOAD SEEDS VVVV //////
 
 public void loadSeedSelection(){
   int n = 0;
   for (int r = 0; r < 6; r++){
     for (int c = 0; c < 8; c++){
         try{
           addObject(new SeedSlot(seeds[n], new Timer(10), seedSelectPlacement[0] + c * 51, seedSelectPlacement[1] + r * 71));
         }catch(Exception e){
           
         }
       
         n++;
     }
   }
 }
 
 public void deloadSeedSelection(){
   List<SeedSlot> seeds;
    seeds = getObjects(SeedSlot.class);
   for (int n = 0; n < seeds.size(); n++){
        removeObject(seeds.get(n));
   }
 }
 
 public boolean addSeed(SeedSlot seed){
   if (gameState == SEEDSELECTION && selectedSeeds.size() < 9){
    selectedSeeds.add(seed); 
    seedUI.load(selectedSeeds);
    return true;
   }
   return false;
 }
 
 ///////////LOADSEEDS ^^^^ ////////
  
  
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
