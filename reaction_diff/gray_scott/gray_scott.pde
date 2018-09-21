Cell[][] grid;
Cell[][] prev;
int resolution = 5;
int cols, rows;
float dA = 1.0;
float dB = 0.4;
float feed = 0.03;
float k = 0.062;

void setup() {
  size(800, 800);
  cols = width / resolution;
  rows = height / resolution;
  grid = new Cell[cols][rows];
  prev = new Cell[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j ++) {
      float a = 1;
      float b = 0;
      grid[i][j] = new Cell(a, b);
      prev[i][j] = new Cell(a, b);
    }
  }
  
  for (int n = 0; n < 10; n++) {
    int startx = int(random(20, rows-20));
    int starty = int(random(20, cols-20));

    for (int i = startx; i < startx+10; i++) {
      for (int j = starty; j < starty+10; j ++) {
        float a = 1;
        float b = 1;
        grid[i][j] = new Cell(a, b);
        prev[i][j] = new Cell(a, b);
      }
    }
  }
}

void draw() {
  update();
  Cell[][] temp = prev;
  prev = grid;
  grid = temp;
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * resolution;
      int y = j * resolution;
      Cell spot = grid[i][j];
      noStroke();
      float a = spot.a;
      float b = spot.b;
      fill(color((a-b)*255));
      rect(x, y, resolution, resolution);
  }
}
}

class Cell {
  float a;
  float b;

  Cell(float a_, float b_) {
    a = a_;
    b = b_;
  }
}

void update() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j ++) {

      Cell spot = prev[i][j];
      Cell newspot = grid[i][j];

      float a = spot.a;
      float b = spot.b;

      float laplaceA = 0;
      laplaceA += a*-1;
      laplaceA += prev[(i+1)%cols][j].a*0.2;
      laplaceA += prev[(((i-1)%cols)+cols)%cols][j].a*0.2;
      laplaceA += prev[i][(j+1)%rows].a*0.2;
      laplaceA += prev[i][(((j-1)%rows)+rows)%rows].a*0.2;
      laplaceA += prev[(((i-1)%cols)+cols)%cols][(((j-1)%rows)+rows)%rows].a*0.05;
      laplaceA += prev[(i+1)%cols][(((j-1)%rows)+rows)%rows].a*0.05;
      laplaceA += prev[(((i-1)%cols)+cols)%cols][(j+1)%rows].a*0.05;
      laplaceA += prev[(i+1)%cols][(j+1)%rows].a*0.05;

      float laplaceB = 0;
      laplaceB += b*-1;
      laplaceB += prev[(i+1)%cols][j].b*0.2;
      laplaceB += prev[(((i-1)%cols)+cols)%cols][j].b*0.2;
      laplaceB += prev[i][(j+1)%rows].b*0.2;
      laplaceB += prev[i][(((j-1)%rows)+rows)%rows].b*0.2;
      laplaceB += prev[(((i-1)%cols)+cols)%cols][(((j-1)%rows)+rows)%rows].b*0.05;
      laplaceB += prev[(i+1)%cols][(((j-1)%rows)+rows)%rows].b*0.05;
      laplaceB += prev[(((i-1)%cols)+cols)%cols][(j+1)%rows].b*0.05;
      laplaceB += prev[(i+1)%cols][(j+1)%rows].b*0.05;

      newspot.a = a + (dA*laplaceA - a*b*b + feed*(1-a))*1;
      newspot.b = b + (dB*laplaceB + a*b*b - (k+feed)*b)*1;

      newspot.a = constrain(newspot.a, 0, 1);
      newspot.b = constrain(newspot.b, 0, 1);
    }
  }
}
