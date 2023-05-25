public class Timer{
  int interval;
  boolean isZero;
  
  public Timer(int interval){
    this.interval = (interval * 60);
    isZero = false;
  }
  
  public boolean runTime(){
   interval--;
   
   if(interval == 0){
     izZero = true;
   }
  }
  
  public int getTime(){
    return this.time();
  }
  
  public boolean checkFinished(){
    return isZero;
  }
}
 
