public class Camera extends Actor {
  Green green;
  public Camera(boolean dot) {
    super(width/2, height/2, 10, 10);
    green = Green.getInstance();
  }

  public Camera() {
    super(width/2, height/2, 0, 0);
    green = Green.getInstance();
  }

  public void act(float deltaTime) {

    if (green.isKeyDown(RIGHT) && getX() + width/2 < Green.getWorld().getWidth()) {
      moveGlobal(8, 0);
    }
    if (green.isKeyDown(LEFT) && getX() > width/2) {
      moveGlobal(-8, 0);
    }
  }
}

public class DebugCamera extends Camera {

  Green green;

  public DebugCamera() {
    super(true);
    green = Green.getInstance();
    Green.getWorld().addObject(this);
  }
  public void act(float deltaTime) {
    if (green.isKeyDown(RIGHT)) {
      moveGlobal(4, 0);
    }
    if (green.isKeyDown(LEFT)) {
      moveGlobal(-4, 0);
    }
    if (green.isKeyDown(UP)) {
      moveGlobal(0, -4);
    }
    if (green.isKeyDown(DOWN)) {
      moveGlobal(0, 4);
    }
    if (green.isKeyDown('z')) {
      System.out.println(getX() + ", " + getY());
    }
  }
}
