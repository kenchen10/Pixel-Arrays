class Rect {
  int rectX, rectY;      // Position of square button
  int rectSize = 50;     // Diameter of rect
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;
  
  Rect (int x, int y, int size, color c, color b, color h, color curr, boolean over) {
    rectX = x;
    rectY = y;
    rectSize = size;
    rectColor = c;
    baseColor = b;
    rectHighlight = h;
    currentColor = curr;
    rectOver = over;
  }
  
  void draw_rect() {
    noFill();
    stroke(255);
    rect(rectX, rectY, rectSize, rectSize); 
    }
    
  boolean overRect(int x, int y, int w, int h)  {
    if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }
  
  void update() {
    if (overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
    } else {
      rectOver = false;
    }
  }
  
}
