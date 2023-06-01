public class Timer{
  int internalCooldown;
  int currentTime;
  
  public Timer(int interval){
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
