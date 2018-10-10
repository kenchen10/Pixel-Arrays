class CA {

  int[] cells;
  int generation;
  int[] rule;
  int resolution = 10;
  int neighbors;
  int rand = 0;
  boolean is_i3 = false;
  boolean is_i5 = false;
  boolean is_search = false;
  boolean is_line = false;
  boolean is_res = false;
  boolean is_half = false;
  boolean is_cycle = false;
  ArrayList<int[]> total_cells;
  boolean is_stop = false;

  CA() {
    cells = new int[width/resolution - width/(resolution * 4)];
   if (rand == 0) {
     for (int i = 0; i < cells.length; i++) {
        cells[i] = floor(random(2));
     }
   } else if (rand == 1) {
     for (int i = 0; i < cells.length; i++) {
       cells[i] = 0;
     }
     cells[cells.length/2] = 1;
   }
  }

  CA(int[] r) {
   rule = r;
   cells = new int[width/resolution-width/(resolution * 4)];
   if (rand == 0) {
     for (int i = 0; i < cells.length; i++) {
        cells[i] = floor(random(2));
     }
   } else if (rand == 1) {
     for (int i = 0; i < cells.length; i++) {
       cells[i] = 0;
     }
     cells[cells.length/2] = 1;
   }
  }

  void start_over() {
   if (rand == 0) {
     for (int i = 0; i < cells.length; i++) {
        cells[i] = floor(random(2));
     }
   } else if (rand == 1) {
     for (int i = 0; i < cells.length; i++) {
       cells[i] = 0;
     }
     cells[cells.length/2] = 1;
   } else if (rand == 2) {
     for (int i = 0; i < ca.cells.length; i++) {
      ca.cells[i] = 0;
    }
    int l = ca.cells.length / 3;
    ca.cells[l] = 1;
    ca.cells[l * 2] = 1;
   } else if (rand == 3) {
     for (int i = 0; i < ca.cells.length; i++) {
      ca.cells[i] = 0;
    }
    int l = ca.cells.length / 4;
    ca.cells[l] = 1;
    ca.cells[l * 2] = 1;
    ca.cells[l * 3] = 1;
   } else if (rand == 4) {
     for (int i = 0; i < ca.cells.length; i++) {
      ca.cells[i] = 0;
    }
    int l = ca.cells.length / 5;
    ca.cells[l] = 1;
    ca.cells[l * 2] = 1;
    ca.cells[l * 3] = 1;
    ca.cells[l * 4] = 1;
   } else if (rand == 5) {
     for (int i = 0; i < ca.cells.length; i++) {
      ca.cells[i] = 0;
    }
    int l = ca.cells.length / 6;
    ca.cells[l] = 1;
    ca.cells[l * 2] = 1;
    ca.cells[l * 3] = 1;
    ca.cells[l * 4] = 1;
    ca.cells[l * 5] = 1;
   }
   generation = 0;
   line = new int[round(height/(ca.resolution*2)) - round(height/(ca.resolution*3))];
   background(255);
  }

  void render() {
    for (int i = 0; i < cells.length; i++) {
       if (cells[i] == 1) {
         fill(0);
       } else {
         fill(255);
       }
       noStroke();
       rect(i * resolution, generation * resolution + height/20, resolution, resolution);
    }
  }

  void generate() {
      int[] next = new int[width/resolution-width/(resolution * 4)];
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
      if (generation == height/resolution) {
        generation = 0;
      } else {
        generation += 1;
      }
  }

  int doRule3(int left, int middle, int right) {
    if (left == 1 && middle == 1 && right == 1) {
      return rule[7];
    } else if (left == 1 && middle == 1 && right == 0) {
      return rule[6];
    } else if (left == 1 && middle == 0 && right == 1) {
      return rule[5];
    } else if (left == 1 && middle == 0 && right == 0) {
      return rule[4];
    } else if (left == 0 && middle == 1 && right == 1) {
      return rule[3];
    } else if (left == 0 && middle == 1 && right == 0) {
      return rule[2];
    } else if (left == 0 && middle == 0 && right == 1) {
      return rule[1];
    } else if (left == 0 && middle == 0 && right == 0) {
      return rule[0];
    }
    return 0;
  }

  int doRule5(int left, int middle1, int middle2, int middle3, int right) {
    if (left == 1 && middle1 == 1 && middle2 == 1 && middle3 == 1 && right == 1) {
      return rule[31];
    } else if (left == 1 && middle1 == 1 && middle2 == 1 && middle3 == 1 && right == 0) {
      return rule[30];
    } else if (left == 1 && middle1 == 1 && middle2 == 1 && middle3 == 0 && right == 1) {
      return rule[29];
    } else if (left == 1 && middle1 == 1 && middle2 == 1 && middle3 == 0 && right == 0) {
      return rule[28];
    }  else if (left == 1 && middle1 == 1 && middle2 == 0 && middle3 == 1 && right == 1) {
      return rule[27];
    } else if (left == 1 && middle1 == 1 && middle2 == 0 && middle3 == 1 && right == 0) {
      return rule[26];
    } else if (left == 1 && middle1 == 1 && middle2 == 0 && middle3 == 0 && right == 1) {
      return rule[25];
    } else if (left == 1 && middle1 == 1 && middle2 == 0 && middle3 == 0 && right == 0) {
      return rule[24];
    } else if (left == 1 && middle1 == 0 && middle2 == 1 && middle3 == 1 && right == 1) {
      return rule[23];
    } else if (left == 1 && middle1 == 0 && middle2 == 1 && middle3 == 1 && right == 0) {
      return rule[22];
    } else if (left == 1 && middle1 == 0 && middle2 == 1 && middle3 == 0 && right == 1) {
      return rule[21];
    } else if (left == 1 && middle1 == 0 && middle2 == 1 && middle3 == 0 && right == 0) {
      return rule[20];
    } else if (left == 1 && middle1 == 0 && middle2 == 0 && middle3 == 1 && right == 1) {
      return rule[19];
    } else if (left == 1 && middle1 == 0 && middle2 == 0 && middle3 == 1 && right == 0) {
      return rule[18];
    } else if (left == 1 && middle1 == 0 && middle2 == 0 && middle3 == 0 && right == 1) {
      return rule[17];
    } else if (left == 1 && middle1 == 0 && middle2 == 0 && middle3 == 0 && right == 0) {
      return rule[16];
    } else if (left == 0 && middle1 == 1 && middle2 == 1 && middle3 == 1 && right == 1) {
      return rule[15];
    } else if (left == 0 && middle1 == 1 && middle2 == 1 && middle3 == 1 && right == 0) {
      return rule[14];
    } else if (left == 0 && middle1 == 1 && middle2 == 1 && middle3 == 0 && right == 1) {
      return rule[13];
    } else if (left == 0 && middle1 == 1 && middle2 == 1 && middle3 == 0 && right == 0) {
      return rule[12];
    } else if (left == 0 && middle1 == 1 && middle2 == 0 && middle3 == 1 && right == 1) {
      return rule[11];
    } else if (left == 0 && middle1 == 1 && middle2 == 0 && middle3 == 1 && right == 0) {
      return rule[10];
    } else if (left == 0 && middle1 == 1 && middle2 == 0 && middle3 == 0 && right == 1) {
      return rule[9];
    } else if (left == 0 && middle1 == 1 && middle2 == 0 && middle3 == 0 && right == 0) {
      return rule[8];
    } else if (left == 0 && middle1 == 0 && middle2 == 1 && middle3 == 1 && right == 1) {
      return rule[7];
    } else if (left == 0 && middle1 == 0 && middle2 == 1 && middle3 == 1 && right == 0) {
      return rule[6];
    } else if (left == 0 && middle1 == 0 && middle2 == 1 && middle3 == 0 && right == 1) {
      return rule[5];
    } else if (left == 0 && middle1 == 0 && middle2 == 1 && middle3 == 0 && right == 0) {
      return rule[4];
    } else if (left == 0 && middle1 == 0 && middle2 == 0 && middle3 == 1 && right == 1) {
      return rule[3];
    } else if (left == 0 && middle1 == 0 && middle2 == 0 && middle3 == 1 && right == 0) {
      return rule[2];
    } else if (left == 0 && middle1 == 0 && middle2 == 0 && middle3 == 0 && right == 1) {
      return rule[1];
    } else if (left == 0 && middle1 == 0 && middle2 == 0 && middle3 == 0 && right == 0) {
      return rule[0];
    }
    return 0;
  }

}
