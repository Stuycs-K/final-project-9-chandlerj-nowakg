public class Timer{
  int holdTime;
  int interval;
  boolean isZero;
  
  public Timer(int interval){
    this.interval = (interval * 60);
    holdTime = interval;
    isZero = false;
  }
  
  public abstract void act(){
    if(isZero = true){
      isZero = false;
      interval = holdTime * 60;
    }
    interval--;
    if(interval == 0){
      isZero = true;
      interval = holdTime;
    }
    
  }
  
