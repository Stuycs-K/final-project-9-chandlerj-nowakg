public class Timer extends Actor{
  int internalCooldown;
  int currentTime;
  
  public Timer(int interval){
    super(width/2, height/2, 0, 0);
    this.internalCooldown = interval;
    currentTime = (internalCooldown*60);
  }
  
  public boolean getStatus(){
   if(this.currentTime == 0){
    return true; 
   }
    return false;
  }
  
  public void act(float deltaTime){
    currentTime--;
    if(currentTime == 0){
     currentTime = (internalCooldown*60); 
    }
  }
}
