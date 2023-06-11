public class SeedUI extends Actor{
  
  Level level = (Level) Green.getWorld();
  
  public final SeedSlot[] seedSlotTemplates = {new PeashooterSeed(), new SunflowerSeed(), new CherrybombSeed(), new WalnutSeed(), new PotatomineSeed(), new SnowpeaSeed(), new ChomperSeed(), new RepeaterSeed(),
                          new PuffshroomSeed(), new SunshroomSeed(), new FumeshroomSeed(), new GravebusterSeed(), new HypnoshroomSeed(), new ScaredyshroomSeed(), new IceshroomSeed(), new DoomshroomSeed(),
                          new LilypadSeed(), new SquashSeed(), new ThreepeaterSeed(), new TanglekelpSeed(),new JalepenoSeed(), new SpikeweedSeed(), new TorchwoodSeed(), new TallnutSeed(), 
                          new SeashroomSeed(), new PlanternSeed(), new CactusSeed(), new BloverSeed(), new SplitpeaSeed(), new StarfruitSeed(), new PumpkinSeed(), new MagnetshroomSeed(),
                          new CabbagepultSeed(), new FlowerpotSeed(), new KernelpultSeed(), new CoffeebeanSeed(), new GarlicSeed(), new UmbrellaleafSeed(), new MarigoldSeed(), new MelonpultSeed(),
                          new GatlingpeaSeed(), new TwinsunflowerSeed(), new GloomshroomSeed(), new CattailSeed(), new WintermelonSeed(), new GoldmagnetSeed(), new SpikerockSeed(), new CobcannonSeed()};
  
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
