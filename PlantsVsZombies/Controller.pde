class Controller {
  static final int MOUSECLICK = 0;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[10];//10 valid buttons 
  }

  /**@param code: a valid constant e.g. LEFTCLICK
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if(code == MOUSECLICK)
      inputs[MOUSECLICK] = true;
  }
  void release(int code) {
    if(code == MOUSECLICK)
    inputs[MOUSECLICK] = false;
  }
}
