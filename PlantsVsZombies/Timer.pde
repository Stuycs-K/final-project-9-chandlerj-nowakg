public class Timer extends Actor{
  int internalCooldown;
  int currentTime;
  
  public Timer(int interval){
    super(width/2, height/2, 0, 0);
    this.internalCooldown = interval;
    currentTime = (internalCooldown);
    Green.getWorld().addObject(this);
  }
  
  public boolean done(){
   return this.currentTime == 0;
  }
  
  public void reset(){
    if(currentTime == 0){
     currentTime = (internalCooldown); 
    }
  }
  
  public void act(float deltaTime){
    currentTime--;
  }
}
