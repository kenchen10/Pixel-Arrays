class CA {
  
  int[] cells;
  int generation;
  int[] rule;
  int resolution;
  int neighbors;
  int rand = 0;
  
  CA(int[] r) {
   rule = r; 
   resolution = 1;
   cells = new int[width/resolution - 57];
   if (rand == 0) {
     for (int i = 0; i < cells.length; i++) {
        cells[i] = floor(random(2)); 
     }
   } else if (rand == 1) {
     for (int i = 0; i < cells.length; i++) {
        cells[i] = 1; 
     }
     cells[cells.length / 2] = 0;
   }
  }
  
  void start_over() {
   if (rand == 0) {
     for (int i = 0; i < cells.length; i++) {
        cells[i] = floor(random(2)); 
     }
   } else if (rand == 1) {
     for (int i = 0; i < cells.length; i++) {
        cells[i] = 1; 
     }
     cells[cells.length / 2] = 0;
   }
   generation = 0;
   background(0);
  }
  
  void render() {
    for (int i = 1; i < cells.length - 1; i++) {
       if (cells[i] == 1) {
         fill(0);
       } else {
         fill(255);
       }
       noStroke();
       rect(i * resolution, generation * resolution + userTB.Y + 45, resolution, resolution);
    }
  }
  
  void generate() {
    int[] next = new int[width/resolution];
    if (neighbors == 3) {
      for (int i = 0; i < cells.length; i++) {
        int left = cells[(((i-1 % cells.length) + cells.length) % cells.length)];
        int middle = cells[i];
        int right = cells[(((i+1 % cells.length) + cells.length) % cells.length)];
        next[i] = doRule3(left, middle, right);
      }
      for (int i = 0; i < cells.length; i++) {
        cells[i] = next[i]; 
      }
    } else if (neighbors == 5) {
      for (int i = 0; i < cells.length; i++) {
        int left = cells[(((i-2 % cells.length) + cells.length) % cells.length)];
        int middle1 = cells[i];
        int middle2 = cells[i];
        int middle3 = cells[i];
        int right = cells[(((i+2 % cells.length) + cells.length) % cells.length)];
        next[i] = doRule5(left, middle1, middle2, middle3, right);
      }
      for (int i = 0; i < cells.length; i++) {
        cells[i] = next[i]; 
      }
    }
    generation += 1;
  }
  
  int doRule3(int left, int middle, int right) {
    if (left == 1 && middle == 1 && right == 1) {
      return rule[0];
    } else if (left == 1 && middle == 1 && right == 0) {
      return rule[1];
    } else if (left == 1 && middle == 0 && right == 1) {
      return rule[2];
    } else if (left == 1 && middle == 0 && right == 0) {
      return rule[3];
    } else if (left == 0 && middle == 1 && right == 1) {
      return rule[4];
    } else if (left == 0 && middle == 1 && right == 0) {
      return rule[5];
    } else if (left == 0 && middle == 0 && right == 0) {
      return rule[6];
    } else if (left == 0 && middle == 0 && right == 0) {
      return rule[7];
    }
    return 0;
  }
  
  int doRule5(int left, int middle1, int middle2, int middle3, int right) {
    if (left == 1 && middle1 == 1 && middle2 == 1 && middle3 == 1 && right == 1) {
      return rule[0];
    } else if (left == 1 && middle1 == 1 && middle2 == 1 && middle3 == 1 && right == 0) {
      return rule[1];
    } else if (left == 1 && middle1 == 1 && middle2 == 1 && middle3 == 0 && right == 1) {
      return rule[2];
    } else if (left == 1 && middle1 == 1 && middle2 == 1 && middle3 == 0 && right == 0) {
      return rule[3];
    }  else if (left == 1 && middle1 == 1 && middle2 == 0 && middle3 == 1 && right == 1) {
      return rule[4];
    } else if (left == 1 && middle1 == 1 && middle2 == 0 && middle3 == 1 && right == 0) {
      return rule[5];
    } else if (left == 1 && middle1 == 1 && middle2 == 0 && middle3 == 0 && right == 1) {
      return rule[6];
    } else if (left == 1 && middle1 == 1 && middle2 == 0 && middle3 == 0 && right == 0) {
      return rule[7];
    } else if (left == 1 && middle1 == 0 && middle2 == 1 && middle3 == 1 && right == 1) {
      return rule[8];
    } else if (left == 1 && middle1 == 0 && middle2 == 1 && middle3 == 1 && right == 0) {
      return rule[9];
    } else if (left == 1 && middle1 == 0 && middle2 == 1 && middle3 == 0 && right == 1) {
      return rule[10];
    } else if (left == 1 && middle1 == 0 && middle2 == 1 && middle3 == 0 && right == 0) {
      return rule[11];
    } else if (left == 1 && middle1 == 0 && middle2 == 0 && middle3 == 1 && right == 1) {
      return rule[12];
    } else if (left == 1 && middle1 == 0 && middle2 == 0 && middle3 == 1 && right == 0) {
      return rule[13];
    } else if (left == 1 && middle1 == 0 && middle2 == 0 && middle3 == 0 && right == 1) {
      return rule[14];
    } else if (left == 1 && middle1 == 0 && middle2 == 0 && middle3 == 0 && right == 0) {
      return rule[15];
    } else if (left == 0 && middle1 == 1 && middle2 == 1 && middle3 == 1 && right == 1) {
      return rule[16];
    } else if (left == 0 && middle1 == 1 && middle2 == 1 && middle3 == 1 && right == 0) {
      return rule[17];
    } else if (left == 0 && middle1 == 1 && middle2 == 1 && middle3 == 0 && right == 1) {
      return rule[18];
    } else if (left == 0 && middle1 == 1 && middle2 == 1 && middle3 == 0 && right == 0) {
      return rule[19];
    } else if (left == 0 && middle1 == 1 && middle2 == 0 && middle3 == 1 && right == 1) {
      return rule[20];
    } else if (left == 0 && middle1 == 1 && middle2 == 0 && middle3 == 1 && right == 0) {
      return rule[21];
    } else if (left == 0 && middle1 == 1 && middle2 == 0 && middle3 == 0 && right == 1) {
      return rule[22];
    } else if (left == 0 && middle1 == 1 && middle2 == 0 && middle3 == 0 && right == 0) {
      return rule[23];
    } else if (left == 0 && middle1 == 0 && middle2 == 1 && middle3 == 1 && right == 1) {
      return rule[24];
    } else if (left == 0 && middle1 == 0 && middle2 == 1 && middle3 == 1 && right == 0) {
      return rule[25];
    } else if (left == 0 && middle1 == 0 && middle2 == 1 && middle3 == 0 && right == 1) {
      return rule[26];
    } else if (left == 0 && middle1 == 0 && middle2 == 1 && middle3 == 0 && right == 0) {
      return rule[27];
    } else if (left == 0 && middle1 == 0 && middle2 == 0 && middle3 == 1 && right == 1) {
      return rule[28];
    } else if (left == 0 && middle1 == 0 && middle2 == 0 && middle3 == 1 && right == 0) {
      return rule[29];
    } else if (left == 0 && middle1 == 0 && middle2 == 0 && middle3 == 0 && right == 1) {
      return rule[30];
    } else if (left == 0 && middle1 == 0 && middle2 == 0 && middle3 == 0 && right == 0) {
      return rule[31];
    } 
    return 0;
  }
  
}
