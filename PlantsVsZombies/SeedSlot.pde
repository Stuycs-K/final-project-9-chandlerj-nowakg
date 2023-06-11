public class SeedSlot extends Actor{
 
  Timer timer;
  String name; //of plant it spawns
  PImage sprite;
  PlantGhost plantGhost;
  Level level = (Level) Green.getWorld();
  
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
    this(name, timer, -100, -100); //offscreen
  }
  
  
  public void act(float deltaTime){
    //System.out.println(timer.currentTime);
    if(plantGhost.inPlacement && !green.isMouseButtonDown(LEFT)){  
        plantGhost.inPlacement = false;
        level.lawn.placePlant(name, mouseX, mouseY, true); 
        level.addSeed(this);
        level.oneSlotSelected = false; 
        timer.reset();
      }
    
    if (timer.done() == true && isMouseButtonDownHere(LEFT) && level.oneSlotSelected == false){
      plantGhost.inPlacement = true;
      level.oneSlotSelected = true; 
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
public class WallnutSeed extends SeedSlot{
 public WallnutSeed(){
   super("Wallnut", new Timer(120, true));
 }
}
public class PotatomineSeed extends SeedSlot{
 public PotatomineSeed(){
   super("Potatomine", new Timer(120, true));
 }
}
public class SnowpeaSeed extends SeedSlot{
 public SnowpeaSeed(){
   super("Snowpea", new Timer(120, true));
 }
}
public class ChomperSeed extends SeedSlot{
 public ChomperSeed(){
   super("Chomper", new Timer(120, true));
 }
}
public class RepeaterSeed extends SeedSlot{
 public RepeaterSeed(){
   super("Repeater", new Timer(120, true));
 }
}
public class PuffshroomSeed extends SeedSlot{
 public PuffshroomSeed(){
   super("Puffshroom", new Timer(120, true));
 }
}
public class SunshroomSeed extends SeedSlot{
 public SunshroomSeed(){
   super("Sunshroom", new Timer(120, true));
 }
}
public class FumeshroomSeed extends SeedSlot{
 public FumeshroomSeed(){
   super("Fumeshroom", new Timer(120, true));
 }
}
public class GravebusterSeed extends SeedSlot{
 public GravebusterSeed(){
   super("Gravebuster", new Timer(720, true));
 }
}
public class HypnoshroomSeed extends SeedSlot{
 public HypnoshroomSeed(){
   super("Hypnoshroom", new Timer(1200, true));
 }
}
public class ScaredyshroomSeed extends SeedSlot{
 public ScaredyshroomSeed(){
   super("Scaredyshroom", new Timer(120, true));
 }
}
public class IceshroomSeed extends SeedSlot{
 public IceshroomSeed(){
   super("Iceshroom", new Timer(1200, true));
 }
}
public class DoomshroomSeed extends SeedSlot{
 public DoomshroomSeed(){
   super("Doomshroom", new Timer(1800, true));
 }
}
public class LilypadSeed extends SeedSlot{
 public LilypadSeed(){
   super("Lilypad", new Timer(120, true));
 }
}
public class SquashSeed extends SeedSlot{
 public SquashSeed(){
   super("Squash", new Timer(480, true));
 }
}
public class ThreepeaterSeed extends SeedSlot{
 public ThreepeaterSeed(){
   super("Threepeater", new Timer(120, true));
 }
}
public class TanglekelpSeed extends SeedSlot{
 public TanglekelpSeed(){
   super("Tanglekelp", new Timer(120, true));
 }
}
public class JalepenoSeed extends SeedSlot{
 public JalepenoSeed(){
   super("Jalepeno", new Timer(120, true));
 }
}
public class SpikeweedSeed extends SeedSlot{
 public SpikeweedSeed(){
   super("Spikeweed", new Timer(120, true));
 }
}
public class TorchwoodSeed extends SeedSlot{
 public TorchwoodSeed(){
   super("Torchwood", new Timer(120, true));
 }
}
public class TallnutSeed extends SeedSlot{
 public TallnutSeed(){
   super("Tallnut", new Timer(1200, true));
 }
}
public class SeashroomSeed extends SeedSlot{
 public SeashroomSeed(){
   super("Seashroom", new Timer(120, true));
 }
}
public class PlanternSeed extends SeedSlot{
 public PlanternSeed(){
   super("Plantern", new Timer(120, true));
 }
}
public class CactusSeed extends SeedSlot{
 public CactusSeed(){
   super("Cactus", new Timer(120, true));
 }
}
public class BloverSeed extends SeedSlot{
 public BloverSeed(){
   super("Blover", new Timer(120, true));
 }
}
public class SplitpeaSeed extends SeedSlot{
 public SplitpeaSeed(){
   super("Splitpea", new Timer(120, true));
 }
}
public class StarfruitSeed extends SeedSlot{
 public StarfruitSeed(){
   super("Starfruit", new Timer(120, true));
 }
}
public class PumpkinSeed extends SeedSlot{
 public PumpkinSeed(){
   super("Pumpkin", new Timer(120, true));
 }
}
public class MagnetshroomSeed extends SeedSlot{
 public MagnetshroomSeed(){
   super("Magnetshroom", new Timer(120, true));
 }
}
public class CabbagepultSeed extends SeedSlot{
 public CabbagepultSeed(){
   super("Cabbagepult", new Timer(120, true));
 }
}
public class FlowerpotSeed extends SeedSlot{
 public FlowerpotSeed(){
   super("Flowerpot", new Timer(120, true));
 }
}
public class KernelpultSeed extends SeedSlot{
 public KernelpultSeed(){
   super("Kernelpult", new Timer(120, true));
 }
}
public class CoffeebeanSeed extends SeedSlot{
 public CoffeebeanSeed(){
   super("Coffeebean", new Timer(120, true));
 }
}
public class GarlicSeed extends SeedSlot{
 public GarlicSeed(){
   super("Garlic", new Timer(120, true));
 }
}
public class UmbrellaleafSeed extends SeedSlot{
 public UmbrellaleafSeed(){
   super("Umbrellaleaf", new Timer(120, true));
 }
}
public class MarigoldSeed extends SeedSlot{
 public MarigoldSeed(){
   super("Marigold", new Timer(120, true));
 }
}
public class MelonpultSeed extends SeedSlot{
 public MelonpultSeed(){
   super("Melonpult", new Timer(120, true));
 }
}
public class GatlingpeaSeed extends SeedSlot{
 public GatlingpeaSeed(){
   super("Gatlingpea", new Timer(120, true));
 }
}
public class TwinsunflowerSeed extends SeedSlot{
 public TwinsunflowerSeed(){
   super("Twinsunflower", new Timer(120, true));
 }
}
public class GloomshroomSeed extends SeedSlot{
 public GloomshroomSeed(){
   super("Gloomshroom", new Timer(120, true));
 }
}
public class CattailSeed extends SeedSlot{
 public CattailSeed(){
   super("Cattail", new Timer(120, true));
 }
}
public class WintermelonSeed extends SeedSlot{
 public WintermelonSeed(){
   super("Wintermelon", new Timer(120, true));
 }
}
public class GoldmagnetSeed extends SeedSlot{
 public GoldmagnetSeed(){
   super("Goldmagnet", new Timer(120, true));
 }
}
public class SpikerockSeed extends SeedSlot{
 public SpikerockSeed(){
   super("Spikerock", new Timer(120, true));
 }
}
public class CobcannonSeed extends SeedSlot{
 public CobcannonSeed(){
   super("Cobcannon", new Timer(120, true));
 }
}
