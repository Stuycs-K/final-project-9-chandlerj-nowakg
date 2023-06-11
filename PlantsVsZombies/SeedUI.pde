public class SeedUI extends Actor{
  
  Level level = (Level) Green.getWorld();
  
  
  
  private final int[] TOPLEFTCOORD = {280, 35};
  
  public void load(SeedSlot[] selection){
    
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

  public SeedUI(){
    super(450,35, loadImage("Sprites/seedslots.jpg"), 0.55f);
  }
  
  public void act(float deltaTime){
    
    
  }
  
}
