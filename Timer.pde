public class Timer extends Actor{
  int internalCooldown;
  int currentTime;
  
  public Timer(int interval){
    this(interval, false);
  }
  
  public Timer(int interval, boolean startAtZero){
    super(width/2, height/2, 0, 0);
    this.internalCooldown = interval;
    
    if(startAtZero){
     currentTime = 0; 
    }
    else{
      currentTime = internalCooldown;
    }
    
    Green.getWorld().addObject(this);   
  }
  
  
  public boolean done(){
   return this.currentTime == 0;
  }
  
  public void reset(){
    currentTime = internalCooldown; 
  }
  
  public void act(float deltaTime){
    if (currentTime > 0){
      currentTime--;
    }    
  }
}
