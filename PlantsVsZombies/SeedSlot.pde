public class SeedSlot extends Actor{
 
  Timer timer;
  String name; //of plant it spawns
  PImage sprite;
  PlantGhost plantGhost;
  Level level = (Level) Green.getWorld();
  boolean inPlacement;
  
  Green green = Green.getInstance();
  
  public SeedSlot(SeedSlot template){
    this(template.name, template.timer);
  }
  
  public SeedSlot(String name, Timer timer, int x, int y){
    super(x, y, 50, 70);
    this.timer = timer;
    this.name = name;
    this.sprite = loadImage("Sprites/Seedslots/" + name + ".png");
    setImage(sprite);
    plantGhost = new PlantGhost(loadImage("Sprites/Plants/" + name + ".png")); 
    level.addObject(plantGhost);  
  }
  
  public SeedSlot(String name, Timer timer){
    this(name, timer, 0, 0);
  }
  
  public void act(float deltaTime){
    //System.out.println(timer.currentTime);
    
    
    if(plantGhost.inPlacement && !green.isMouseButtonDown(LEFT)){
      
        plantGhost.inPlacement = false;
        
        level.lawn.placePlant(name, mouseX, mouseY, true); 
        timer.reset();
      }
    
    if (timer.done() == true && isMouseButtonDownHere(LEFT)){
      plantGhost.inPlacement = true;
    }
    else{
      setOpacity(( (float) (timer.internalCooldown - timer.currentTime) / (float) timer.internalCooldown) * 150f + 75f);
    }
   
  }
  
}

public class PeashooterSeed extends SeedSlot{
 public PeashooterSeed(){
   super("Peashooter", new Timer(120, true));
 }
}

public class SunflowerSeed extends SeedSlot{
 public SunflowerSeed(){
   super("Sunflower", new Timer(120, true));
 }
}

public class CherrybombSeed extends SeedSlot{
 public CherrybombSeed(){
   super("Cherrybomb", new Timer(120, true));
 }
}
