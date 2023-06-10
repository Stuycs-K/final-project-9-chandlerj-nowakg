public class SeedSlot extends Actor{
 
  Timer timer;
  String name; //of plant it spawns
  PImage sprite;
  PlantGhost plantGhost;
  Level level = (Level) Green.getWorld();
  boolean inPlacement;
  
  Green green = Green.getInstance();
  
  public SeedSlot(SeedSlot template){
    this(template.name, template.timer, template.getImage());
  }
  
  public SeedSlot(String name, Timer timer, PImage sprite){
    super(0, 0, sprite);
    this.timer = timer;
    this.name = name;
    this.sprite = sprite;
    plantGhost = new PlantGhost(loadImage("Sprites/Plants/" + name + ".png")); 
    level.addObject(plantGhost);  
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
   super("Peashooter", new Timer(120, true), loadImage("Sprites/Seedslots/Peashooter.png"));
 }
}

public class SunflowerSeed extends SeedSlot{
 public SunflowerSeed(){
   super("Sunflower", new Timer(120, true), loadImage("Sprites/Seedslots/Sunflower.png"));
 }
}

public class CherrybombSeed extends SeedSlot{
 public CherrybombSeed(){
   super("Cherrybomb", new Timer(120, true), loadImage("Sprites/Seedslots/Cherrybomb.png"));
 }
}
