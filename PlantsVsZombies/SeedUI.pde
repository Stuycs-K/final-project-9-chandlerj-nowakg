public class SeedUI extends Actor{
  
  //public SeedSlot[] seedSlotTemplates = {new PeashooterSeed(), new SunflowerSeed(), new CherrybombSeed()}; //more to come
  
  Level level = (Level) Green.getWorld();
  
  private final int[] TOPLEFTCOORD = {280, 35};
  
  public SeedUI(SeedSlot[] selection){
    super(450,35, loadImage("Sprites/seedslots.jpg"), 0.55f);
    SeedSlot slot;
    for (int n = 0; n < selection.length; n++){
      
      if (selection[n] == null){
       break; 
      }
      
      slot = new SeedSlot(selection[n]);
      level.addObject(slot);
      slot.setX(TOPLEFTCOORD[0] + 52 * n);
      slot.setY(TOPLEFTCOORD[1]);
      slot.setZ(10);
    }
  }
  
  public void addedToWorld(World world){
    
  }
  
  public void act(float deltaTime){
    
    
  }
  
}
