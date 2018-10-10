class Rect {
  int rectX, rectY;      // Position of square button
  int rectW;     // Diameter of rect
  int rectH;     // Diameter of rect
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;
  boolean ignore = false;
  boolean is_3 = false;
  boolean is_on = false;
  boolean is_5 = false;
  int v;
  boolean is_start = false;
  
  Rect (int x, int y, int w, int ht, color c, color b, color h, color curr, boolean over) {
    rectX = x;
    rectY = y;
    rectW = w;
    rectH = ht;
    rectColor = c;
    baseColor = b;
    rectHighlight = h;
    currentColor = curr;
    rectOver = over;
  }
  
  void draw_rect() {
    if (is_on) {
      fill(10, 255, 10);
      noStroke();
      rect(rectX, rectY, rectW, rectH, 5); 
    }
    else {
      currentColor = rectColor;
      fill(currentColor);
      noStroke();
      rect(rectX, rectY, rectW, rectH, 5); 
    }
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
    if (overRect(rectX, rectY, rectW, rectH) && !ignore) {
      rectColor = rectHighlight;
      rectOver = true;
    } else {
      rectColor = baseColor;
      rectOver = false;
    }
  }
  
}
