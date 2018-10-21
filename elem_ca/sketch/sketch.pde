int start_i = 0;
int start_j = 0;

void settings() {
   size(2550, 1300);
}

void setup() {
   // USERNAME TEXTBOX
   // CONFIGURED USING THE GLOBAL VARS
   load_data();
   load_input();
   int[] starting_rule = new int[8];
   for (int i = 0; i < 8; i++) {
      starting_rule[i] = 0;
   }
   ca = new CA(starting_rule);
   ca.neighbors = 3;
   load_rects();
   background(0);
   line = new int[round(height/(ca.resolution*2)) - round(height/(ca.resolution*3))];
   ca.total_cells = new ArrayList<int[]>();
}

void draw() {
   // Start Screen
   if (done_n == false) {
    background(0);
    text("How many neighbors?", start_box.X, start_box.Y - 10);
    fill(250, 250, 250);
    start_box.DRAW();
  } else if (done_r == false) {
    background(0);
    text("What rule (in hex)?", start_box.X, start_box.Y - 10);
    fill(250, 250, 250);
    if (ca.neighbors == 3) {start_box.maxLen = 1;}
    else if (ca.neighbors == 5) {start_box.maxLen = 7;}
    start_box.DRAW();
  } else if (done_o == false) {
    start_box.maxLen = 0;
    background(0);
    text("How many on bits (0 for random, 1-5 non-random)?", start_box.X, start_box.Y - 10);
    fill(250, 250, 250);
    start_box.DRAW();
  } else {
   for (Rect r: rects) {
     r.update();
   }
   if (ca.is_cycle && ca.generation == height/ca.resolution) {
    ca.is_search = false;
    for (int i = 0; i < ca.rule.length; i++) {
      ca.rule[i] = floor(random(2));
    }
    ca.start_over();
   }
   fill(250, 250, 250);
   fill(96, 157, 255);
   rect(10, 10, width - 20, userTB.H, 5); 
   // DRAW THE TEXTBOXES
   userTB.DRAW();
   tb2.DRAW();
   tb2.maxLen = 1;
   if (ca.neighbors == 3 && ca.rand == 0) {
     checkLine3();
   } else if (ca.neighbors == 5 && ca.rand == 0) {
     checkLine5();
   }
   if (ca.is_half == true && ca.rand == 0 && ca.generation == round(height/(ca.resolution*2))) {
    int count = 0;
    for (int i = 1; i < ca.cells.length; i++) {
      if (ca.cells[i] != ca.cells[i-1]) {
        count += 1;
      }
    }
    percent = float(count) / float(ca.cells.length);
   } else if (ca.is_half == false) {
     checkHalf();
   }
   String str = "";
     for(int j=0;j<ca.rule.length;j++) {
        str = str + Integer.toString(ca.rule[j]);
     }
   for (int i = 0; i < lines_alist.size(); i++) {
     if (ca.neighbors == 3 && ca.is_half && str.equals(lines_alist.get(i))) {
     
     }
     
   }
   if (ca.neighbors == 3 && ca.is_half && lines_alist.contains(str)) {
    half3_alist.remove(str);
    Object[] o = half3_alist.toArray();
    String[] temp = Arrays.copyOf(o, o.length, String[].class);
    half3 = temp;
    saveStrings("half_3.txt", half3);
    for (int i = 0; i < ca.rule.length; i++) {
      ca.rule[i] = half3[1].charAt(i) - '0';
    }
    ca.start_over();
   } else if (ca.neighbors == 5 && ca.is_half && lines5_alist.contains(str)) {
     half5_alist.remove(str);
          Object[] o = half5_alist.toArray();
          String[] temp = Arrays.copyOf(o, o.length, String[].class);
          half5 = temp;
          saveStrings("half_5.txt", half5);
   }
   checkIgnore();
   
   ca.render();
   ca.generate();
   
   fill(0);
   for (Rect r: rects) {
     if (r.is_3 && ca.neighbors != 3) {
       continue;
     } else if (r.is_5 && ca.neighbors != 5) {
       continue;
     }
     r.draw_rect();
   }
   draw_text();
  }
}



void checkLine3() {
  if (ca.generation > round(height/(ca.resolution * 3)) && ca.generation < round(height/(ca.resolution * 2))) {
    line[ca.generation - (round(height/(ca.resolution * 3)))] = ca.cells[5];
  }
  String str = "";
         for(int j=0;j<ca.rule.length;j++) {
            str = str + Integer.toString(ca.rule[j]);
         }
  if (ca.generation > round(height/(ca.resolution * 2)) && ca.is_line == false && !lines_alist.contains(str)) {
    for (int i = 1; i < line.length; i++) {
      if (line[i-1] != line[i]) {
        return;
      }
    }
    lines_alist.add(str);
    Object[] o = lines_alist.toArray();
    String[] temp = Arrays.copyOf(o, o.length, String[].class);
    lines = temp;
    saveStrings("lines.txt", lines);
    ca.is_line = true;
  }
}

void checkLine5() {
  if (ca.generation > round(height/(ca.resolution * 3)) && ca.generation < round(height/(ca.resolution * 2))) {
    line[ca.generation - (round(height/(ca.resolution * 3)))] = ca.cells[5];
  }
  String str = "";
  for(int j=0;j<ca.rule.length;j++) {
      str = str + Integer.toString(ca.rule[j]);
  }
  if (ca.generation > round(height/(ca.resolution * 2)) && ca.is_line == false && !lines5_alist.contains(str)) {
    for (int i = 1; i < line.length; i++) {
      if (line[i-1] != line[i]) {
        return;
      }
    }
    lines5_alist.add(str);
    Object[] o = lines5_alist.toArray();
    String[] temp = Arrays.copyOf(o, o.length, String[].class);
    lines5 = temp;
    saveStrings("lines5.txt", lines5);
    ca.is_line = true;
  }
}

void checkHalf() {
  String str = "";
  for(int j=0;j<ca.rule.length;j++) {
    str = str + Integer.toString(ca.rule[j]);
  }
  if (ca.rand == 0) {
    int count = 0;
    if (!ca.is_half && ca.neighbors == 3 && ca.generation == round(height/(ca.resolution*2)) && !half3_alist.contains(str) && !lines_alist.contains(str)) {
      for (int i = 1; i < ca.cells.length; i++) {
        if (ca.cells[i] != ca.cells[i-1]) {
          count += 1;
        }
      }
      if (float(count)/float(ca.cells.length) >= .6) {
        half3_alist.add(str);
        Object[] o = half3_alist.toArray();
        String[] temp = Arrays.copyOf(o, o.length, String[].class);
        half3 = temp;
        saveStrings("half_3.txt", half3);
      }
    } else if (!ca.is_half && ca.neighbors == 5 && ca.generation == round(height/(ca.resolution*2)) && !half5_alist.contains(str) && !lines5_alist.contains(str)) {
      for (int i = 1; i < ca.cells.length; i++) {
        if (ca.cells[i] != ca.cells[i-1]) {
          count += 1;
        }
      }
      if (float(count)/float(ca.cells.length) >= .6) {
        half5_alist.add(str);
        Object[] o = half5_alist.toArray();
        String[] temp = Arrays.copyOf(o, o.length, String[].class);
        half5 = temp;
        saveStrings("half_5.txt", half5);
      }
    }
  }
}

void checkIgnore() {
  String str = "";
         for(int j=0;j<ca.rule.length;j++) {
            str = str + Integer.toString(ca.rule[j]);
         }
  if (!ca.is_search && !ca.is_line && !ca.is_res && !ca.is_half && !ca.is_cycle && !ca.is_stop) {
    if (ca.neighbors == 3 && !ca.is_i3) {
      if (i3_alist.contains(str)) {
        if (no_i3_alist.contains(str)) {
          no_i3_alist.remove(str);
          Object[] o = no_i3_alist.toArray();
          String[] temp = Arrays.copyOf(o, o.length, String[].class);
          no_i3 = temp;
          saveStrings("no_i.txt", no_i3);
        }
        for (int j = 0; j < 8; j++) {
              ca.rule[j] = floor(random(2));
              ca.start_over();
        }
      } else if (!no_i3_alist.contains(str)) {
        no_i3_alist.add(str);
        Object[] o = no_i3_alist.toArray();
        String[] temp = Arrays.copyOf(o, o.length, String[].class);
        no_i3 = temp;
        saveStrings("no_i.txt", no_i3);
      }
   } else if (ca.neighbors == 5 && !ca.is_i5 && !ca.is_res) {
      if (i5_alist.contains(str)) {
        for (int j = 0; j < 32; j++) {
              ca.rule[j] = floor(random(2));
              ca.start_over();
        }
      }
    }
  }
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
       t.PRESSED(mouseX, mouseY);
   }
   for (Rect r: rects) {
     if (ca.neighbors == 5 && r.is_3) {
       r.is_on = false;
     }
     if (ca.neighbors == 3 && r.is_5) {
       r.is_on = false;
     }
     if (r.is_5 && r.rectOver && !r.is_start) {
       r.is_on = !r.is_on;
     }
   }
   ca.is_res = false;
   if (done_n == false || done_n == true && done_r == false || done_n == true && done_r == true && done_o == false) {
     start_box.PRESSED(mouseX, mouseY);
   }
   if (stop.rectOver) {
     ca.is_stop = !ca.is_stop;
     ca.is_search = true;
   }
   if (start5.rectOver) {
     ca.is_stop = false;
     for (int i = 0; i < ca.rule.length; i++) {
       ca.rule[i] = 0;
     }
     for (Rect r: rects) {
       if (r.is_5 && !r.is_start) {
         if (r.is_on) {
           ca.rule[r.v] = 1;
         }
       }
     }
     ca.start_over();
   } else if (start3.rectOver) {
     ca.is_stop = false;
     for (int i = 0; i < ca.rule.length; i++) {
       ca.rule[i] = 0;
     }
     if (b000.is_on) {
       ca.rule[0] = 1;
     } if (b001.is_on) {
       ca.rule[1] = 1;
     } if (b010.is_on) {
       ca.rule[2] = 1;
     } if (b011.is_on) {
       ca.rule[3] = 1;
     } if (b100.is_on) {
       ca.rule[4] = 1;
     } if (b101.is_on) {
       ca.rule[5] = 1;
     } if (b110.is_on) {
       ca.rule[6] = 1;
     } if (b111.is_on) {
       ca.rule[7] = 1;
     }
     ca.start_over();
   } else if (b000.rectOver) {
     b000.is_on = !b000.is_on;
   } else if (b001.rectOver) {
     b001.is_on = !b001.is_on;
   } else if (b010.rectOver) {
     b010.is_on = !b010.is_on;
   } else if (b011.rectOver) {
     b011.is_on = !b011.is_on;
   } else if (b100.rectOver) {
     b100.is_on = !b100.is_on;
   } else if (b101.rectOver) {
     b101.is_on = !b101.is_on;
   } else if (b110.rectOver) {
     b110.is_on = !b110.is_on;
   } else if (b111.rectOver) {
     b111.is_on = !b111.is_on;
   } else if (rect_c.rectOver && ca.is_cycle) {
     ca.is_cycle = false;
   } else if (rect_c.rectOver) {
     ca.is_cycle = true;
     ca.is_search = false;
    rect_n.currentColor = rect_n.rectColor;
    for (int i = 0; i < ca.rule.length; i++) {
      ca.rule[i] = floor(random(2));
    }
    ca.is_half = false;
    ca.is_line = false;
    ca.start_over();
   } else if (rect_i.rectOver && ca.rule.length == 32 && ca.is_i5) {
     ca.is_stop = false;
    ca.is_search = false;
    String str = "";
    for (int j=0;j<ca.rule.length;j++) {
        str = str + Integer.toString(ca.rule[j]);
    }
    i5_alist.remove(str);
    Object[] o = i5_alist.toArray();
    String[] temp = Arrays.copyOf(o, o.length, String[].class);
    ignore_5 = temp;
    saveStrings("data_5.txt", ignore_5);
    counter = counter + 1;
    String t = ignore_5[counter % ignore_5.length];
    for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = t.charAt(i)-'0';
    }
    ca.is_cycle = false;
    ca.is_line = false;
    ca.is_half = false;
    ca.start_over();
  } else if (rect_i.rectOver && ca.rule.length == 8 && ca.is_i3) {
    ca.is_stop = false;
    ca.is_search = false;
    String str = "";
    for (int j=0;j<ca.rule.length;j++) {
        str = str + Integer.toString(ca.rule[j]);
    }
    i3_alist.remove(str);
    Object[] o = i3_alist.toArray();
    String[] temp = Arrays.copyOf(o, o.length, String[].class);
    ignore_3 = temp;
    saveStrings("data_3.txt", ignore_3);
    counter += 1;
    String t = ignore_3[counter % ignore_3.length];
    for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = t.charAt(i)-'0';
    }
    ca.is_line = false;
    ca.is_cycle = false;
    ca.is_half = false;
    ca.start_over();
  } else if (rect_i.rectOver && ca.rule.length == 32 && !ca.is_i5 && !ca.is_i3) {
    ca.is_stop = false;
    ca.is_search = false;
    String str = "";
    for (int j=0;j<ca.rule.length;j++) {
        str = str + Integer.toString(ca.rule[j]);
    }
    String[] temp = new String[ignore_5.length + 1];
    for (int i = 0; i < ignore_5.length; i++) {
        temp[i] = ignore_5[i];
    }
    temp[temp.length - 1] = str;
    ignore_5 = new String[temp.length];
    ignore_5 = temp;
    for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = floor(random(2));
    }
    ca.is_line = false;
    ca.is_cycle = false;
    ca.is_half = false;
    saveStrings("data_5.txt", ignore_5);
    ca.start_over();
  } else if (rect_i.rectOver && ca.rule.length == 8 && !ca.is_i5 && !ca.is_i3) {
    ca.is_stop = false;
    ca.is_search = false;
    String str = "";
    for (int j=0;j<ca.rule.length;j++) {
        str = str + Integer.toString(ca.rule[j]);
    }
    String[] temp = new String[ignore_3.length + 1];
    for (int i = 0; i < ignore_3.length; i++) {
        temp[i] = ignore_3[i];
    }
    temp[temp.length - 1] = str;
    ignore_3 = new String[temp.length];
    ignore_3 = temp;
    for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = floor(random(2));
    }
    ca.is_line = false;
    ca.is_cycle = false;
    ca.is_half = false;
    saveStrings("data_3.txt", ignore_3);
    ca.start_over();
  } else if (rect_i5.rectOver && ca.rule.length == 32 && ca.is_i5) {
    ca.is_stop = false;
    ca.is_search = false;
    rect_i5.currentColor = rect_i5.rectColor;
    ca.is_i5 = false;
    for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = floor(random(2));
    }
    ca.is_line = false;
    ca.is_cycle = false;
    ca.is_half = false;
    ca.start_over();
  } else if (rect_i5.rectOver) {
    ca.is_stop = false;
    ca.is_search = false;
    rect_i5.currentColor = rect_i5.rectColor;
    ca.is_i5 = true;
    ca.is_i3 = false;
    ca.rule = new int[32];
    String temp = ignore_5[floor(random(ignore_5.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = false;
    ca.is_cycle = false;
    ca.is_half = false;
    ca.neighbors = 5;
    ca.start_over();
  } else if (rect_i3.rectOver && ca.rule.length == 8 && ca.is_i3) {
    ca.is_stop = false;
    ca.is_search = false;
    rect_i3.currentColor = rect_i3.rectColor;
    ca.is_i3 = false;
    for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = floor(random(2));
    }
    ca.is_line = false;
    ca.is_cycle = false;
    ca.is_half = false;
    ca.start_over();
  } else if (rect_i3.rectOver) {
    ca.is_stop = false;
    ca.is_search = false;
    rect_i3.currentColor = rect_i3.rectColor;
    ca.is_i3 = true;
    ca.is_i5 = false;
    ca.rule = new int[8];
    String temp = ignore_3[floor(random(ignore_3.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = false;
    ca.is_cycle = false;
    ca.is_half = false;
    ca.neighbors = 3;
    ca.start_over();
  } else if (rect_l3.rectOver) {
    ca.is_stop = false;
    ca.is_search = false;
    rect_l3.currentColor = rect_l3.rectColor;
    ca.is_i5 = false;
    ca.is_i3 = false;
    ca.rule = new int[8];
    String temp = lines[floor(random(lines.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = true;
    ca.is_cycle = false;
    ca.is_half = false;
    ca.neighbors = 3;
    ca.start_over();
  } else if (rect_l5.rectOver) {
    ca.is_stop = false;
    ca.is_search = false;
    rect_l5.currentColor = rect_l5.rectColor;
    ca.is_i5 = false;
    ca.is_i3 = false;
    ca.rule = new int[32];
    String temp = lines5[floor(random(lines5.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = true;
    ca.is_half = false;
    ca.is_cycle = false;
    ca.neighbors = 5;
    ca.start_over();
  } else if (rect_h3.rectOver) {
    ca.is_stop = false;
    ca.is_search = false;
    ca.is_i5 = false;
    ca.is_i3 = false;
    ca.rule = new int[8];
    String temp = half3[floor(random(half3.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_half = true;
    ca.is_cycle = false;
    ca.neighbors = 3;
    ca.start_over();
  } else if (rect_h5.rectOver) {
    ca.is_stop = false;
    ca.is_search = false;
    ca.is_i5 = false;
    ca.is_i3 = false;
    ca.rule = new int[32];
    String temp = half5[floor(random(half5.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_half = true;
    ca.neighbors = 5;
    ca.start_over();
  } else if (rect_3.rectOver) {
    ca.is_stop = false;
    ca.is_search = false;
    ca.is_i3 = false;
    ca.is_i5 = false;
    ca.is_line = false;
    ca.is_half = false;
    ca.is_cycle = false;
    rect_3.currentColor = rect_3.rectColor;
    ca.neighbors = 3;
    userTB.maxLen = 1;
    if (ca.rule.length != 8) {
      ca.rule = new int[8];
      for (int i = 0; i < ca.rule.length; i++) {
          ca.rule[i] = floor(random(2));
      }
    }
    ca.start_over();
  } else if (rect_5.rectOver) {
    ca.is_stop = false;
    ca.is_i3 = false;
    ca.is_i5 = false;
    ca.is_search = false;
    ca.is_cycle = false;
    ca.is_line = false;
    ca.is_half = false;
    rect_5.currentColor = rect_5.rectColor;
    ca.neighbors = 5;
    userTB.maxLen = 7;
    if (ca.rule.length != 32) {
      ca.rule = new int[32];
      for (int i = 0; i < ca.rule.length; i++) {
          ca.rule[i] = floor(random(2));
      }
    }
    ca.start_over();
  } else if (rect_r.rectOver) {
    ca.is_stop = false;
    rect_r.currentColor = rect_r.rectColor;
    ca.rand = 0;
    ca.start_over();
  } else if (rect_h.rectOver) {
    ca.is_stop = false;
    rect_h.currentColor = rect_h.rectColor;
    ca.rand = 1;
    ca.start_over();
  } else if (rect_n2.rectOver) {
    ca.is_stop = false;
    ca.rand = 2;
    ca.start_over();
  } else if (rect_n3.rectOver) {
    ca.is_stop = false;
    ca.rand = 3;
    ca.start_over();
  } else if (rect_n4.rectOver) {
    ca.is_stop = false;
    ca.rand = 4;
    ca.start_over();
  } else if (rect_n5.rectOver) {
    ca.is_stop = false;
    rect_h.currentColor = rect_h.rectColor;
    ca.rand = 5;
    ca.start_over();
  } else if (rect_n.rectOver && ca.is_half && ca.neighbors == 5) {
    ca.is_stop = false;
    ca.is_search = false;
    String temp = half5[floor(random(half5.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_half = true;
    ca.start_over();
  } else if (rect_n.rectOver && ca.is_half && ca.neighbors == 3) {
    ca.is_stop = false;
    ca.is_search = false;
    String temp = half3[floor(random(half3.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_half = true;
    ca.start_over();
  } else if (rect_n.rectOver && ca.is_i3) {
    ca.is_stop = false;
    ca.is_search = false;
    String temp = ignore_3[floor(random(ignore_3.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = false;
    ca.start_over();
  } else if (rect_n.rectOver && ca.is_i5) {
    ca.is_stop = false;
    ca.is_search = false;
    String temp = ignore_5[floor(random(ignore_5.length))];
    for (int i = 0; i < temp.length(); i++) {
      ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = false;
    ca.start_over();
  } else if (rect_n.rectOver && ca.is_line && ca.neighbors == 3) {
    ca.is_stop = false;
    ca.is_search = false;
    String temp = lines[floor(random(lines.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = true;
    ca.start_over();
  } else if (rect_n.rectOver && ca.is_line && ca.neighbors == 5) {
    ca.is_stop = false;
    ca.is_search = false;
    String temp = lines5[floor(random(lines5.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = true;
    ca.start_over();
  } else if (rect_n.rectOver) {
    ca.is_stop = false;
    ca.is_search = false;
    rect_n.currentColor = rect_n.rectColor;
    for (int i = 0; i < ca.rule.length; i++) {
      ca.rule[i] = floor(random(2));
    }
    ca.is_half = false;
    ca.is_line = false;
    ca.is_cycle = false;
    ca.start_over();
  }
  percent = 0;
}

void keyPressed() {
  for (TEXTBOX t : textboxes) {
      t.KEYPRESSED(key, (int)keyCode);
   }
   if (done_n == false || done_n == true && done_r == false || done_n == true && done_r == true && done_o == false) {
     start_box.KEYPRESSED(key, (int)keyCode);
   } if (done_n == false && start_box.Text.length() == 1) {
     if (key == '\n' && int(start_box.Text) == 3) {
        ca.is_i3 = false;
        ca.is_i5 = false;
        ca.is_search = false;
        ca.neighbors = 3;
        userTB.maxLen = 1;
        if (ca.rule.length != 8) {
          ca.rule = new int[8];
          for (int i = 0; i < ca.rule.length; i++) {
              ca.rule[i] = floor(random(2));
          }
        }
        ca.is_line = false;
        ca.is_half = false;
        //ca.start_over();
        done_n = true;
        start_box.Text = "";
     } else if (key == '\n' && int(start_box.Text) == 5) {
      ca.is_i3 = false;
      ca.is_i5 = false;
      ca.is_search = false;
      rect_5.currentColor = rect_5.rectColor;
      ca.neighbors = 5;
      userTB.maxLen = 7;
      ca.is_half = false;
      if (ca.rule.length != 32) {
        ca.rule = new int[32];
        for (int i = 0; i < ca.rule.length; i++) {
            ca.rule[i] = floor(random(2));
        }
      }
      ca.is_line = false;
      //ca.start_over();
      done_n = true;
      start_box.Text = "";
     }
   } else if (key == '\n' && done_n == true && done_r == false && start_box.Text.length() == 2 && (start_box.Text.toUpperCase().matches("[A-F0-9]+"))) {
    background(0);
    String temp = new BigInteger(start_box.Text, 16).toString(2);
    Integer length = temp.length();
    if (length < 8) {
        for (int i = 0; i < 8 - length; i++) {
            temp = "0" + temp;
        }
    }
    int[] r = new int[8];
    for (int i = 0; i < 8; i++) {
       r[i] = temp.charAt(i) - '0';
    }
    for (int i = 0; i < ca.rule.length; i++) {
       ca.rule[i] = r[i];
    }
    ca.is_search = true;
    start_box.Text = "";
    start_box.TextLength = 0;
    done_r = true;
    //ca.start_over();
   } else if (key == '\n' && done_n == true && done_r == false && start_box.Text.length() == 8 && (start_box.Text.toUpperCase().matches("[A-F0-9]+"))) {
    background(0);
    String temp = new BigInteger(start_box.Text, 16).toString(2);
    Integer length = temp.length();
    if (length < 32) {
        for (int i = 0; i < 32 - length; i++) {
            temp = "0" + temp;
        }
    }
    int[] r = new int[32];
    for (int i = 0; i < 32; i++) {
       r[i] = temp.charAt(i) - '0';
    }
    for (int i = 0; i < ca.rule.length; i++) {
       ca.rule[i] = r[i];
    }
    ca.is_search = true;
    start_box.Text = "";
    start_box.TextLength = 0;
    done_r = true;
    //ca.start_over();
   } else if (key == '\n' && done_n == true && done_r == true && done_o == false && start_box.Text.length() == 1 && int(start_box.Text) >= 0 && int(start_box.Text) < 6) {
     ca.rand = int(start_box.Text);
     ca.start_over();
     start_box.Text = "";
     start_box.TextLength = 0;
     done_o = true;
   } else if (key == '\n' && tb2.Text.length() > 0 && tb2.Text.length() < 3 && int(tb2.Text) > 0 && int(tb2.Text) < 70) {
    background(255);
    ca.resolution = int(tb2.Text);
    ca.cells = new int[width/ca.resolution - width/(ca.resolution * 4)];
    ca.start_over();
    ca.is_search = false;
    tb2.Text = "";
    tb2.TextLength = 0;
    ca.is_res = true;
  } else if (key == '\n' && userTB.Text.length() == 2 && (userTB.Text.toUpperCase().matches("[A-F0-9]+"))) {
    background(255);
    String temp = new BigInteger(userTB.Text, 16).toString(2);
    Integer length = temp.length();
    if (length < 8) {
        for (int i = 0; i < 8 - length; i++) {
            temp = "0" + temp;
        }
    }
    int[] r = new int[8];
    for (int i = 0; i < 8; i++) {
       r[i] = temp.charAt(i) - '0';
    }
    for (int i = 0; i < ca.rule.length; i++) {
       ca.rule[i] = r[i];
    }
    ca.is_i3 = false;
    ca.is_half = false;
    ca.is_line = false;
    ca.is_search = true;
    userTB.Text = "";
    userTB.TextLength = 0;
    ca.start_over();
  } else if (key == '\n' && userTB.Text.length() == 8 && (userTB.Text.toUpperCase().matches("[A-F0-9]+"))) {
    background(255);
    ca.is_search = true;
    ca.is_i3 = false;
    ca.is_half = false;
    ca.is_line = false;
    String temp = new BigInteger(userTB.Text, 16).toString(2);
    Integer length = temp.length();
    if (length < 32) {
        for (int i = 0; i < 32 - length; i++) {
            temp = "0" + temp;
        }
    }
    int[] r = new int[32];
    for (int i = 0; i < 32; i++) {
       r[i] = temp.charAt(i) -'0';
    }
    for (int i = 0; i < ca.rule.length; i++) {
       ca.rule[i] = r[i];
    }
    userTB.Text = "";
    userTB.TextLength = 0;
    ca.start_over();
  }
}
