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
     isZero = true;
   }
  }
  
  public int getTime(){
    return (this.interval() / 60);
  }
  
  public boolean checkFinished(){
    return isZero;
  }
}
 
