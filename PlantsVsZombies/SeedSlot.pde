public class SeedSlot extends Actor{
 
  Timer timer;
  String name; //of plant it spawns
  PImage sprite;
  
  public SeedSlot(SeedSlot template){
    this(template.name, template.timer, template.getImage());
  }
  
  public SeedSlot(String name, Timer timer, PImage sprite){
    super(0, 0, sprite);
    this.timer = timer;
    this.name = name;
    this.sprite = sprite;
  }
  
  
  public void act(float deltaTime){
    if (isMouseButtonDownHere(LEFT) && timer.done() == true){
      //send the plant
      tint(0);
      System.out.println("HI"  );
      timer.reset();
    }
  }
  
}

public class PeashooterSeed extends SeedSlot{
 public PeashooterSeed(){
   super("Peashooter", new Timer(5), loadImage("Sprites/Seedslots/Peashooter.png"));
 }
}

public class SunflowerSeed extends SeedSlot{
 public SunflowerSeed(){
   super("Sunflower", new Timer(5), loadImage("Sprites/Seedslots/Sunflower.png"));
 }
}

public class CherrybombSeed extends SeedSlot{
 public CherrybombSeed(){
   super("Cherrybomb", new Timer(5), loadImage("Sprites/Seedslots/Cherrybomb.png"));
 }
}
