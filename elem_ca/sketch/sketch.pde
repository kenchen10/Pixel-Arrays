import java.util.Arrays; 
import java.lang.Integer;
import java.math.BigInteger;

ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
TEXTBOX userTB;
TEXTBOX tb2;

int counter = 0;

String[] ignore_3;
String[] no_i3;
String[] ignore_5;
String[] lines;
int[] line = new int[60];
String[] lines5;

ArrayList<String> i3_alist;
ArrayList<String> no_i3_alist;
ArrayList<String> i5_alist;
ArrayList<String> lines_alist;
ArrayList<String> lines5_alist;

CA ca;

Rect rect_3;
Rect rect_5;
Rect rect_r;
Rect rect_h;
Rect rect_n;
Rect rect_i3;
Rect rect_i5;
Rect rect_i;
Rect rect_n2;
Rect rect_n3;
Rect rect_n4;
Rect rect_n5;


Rect style;
Rect style2;
Rect style3;

ArrayList<Rect> rects = new ArrayList<Rect>();

void startScreen(){
  background(0);
  textSize(100);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Kenny Chen", width/2, height/2);
}

void settings() {
   size(2450, 1300);
}

void setup() {
   // USERNAME TEXTBOX
   // CONFIGURED USING THE GLOBAL VARS
   ignore_3 = loadStrings("data_3.txt");
   ignore_5 = loadStrings("data_5.txt");
   lines = loadStrings("lines.txt");
   lines5 = loadStrings("lines5.txt");
   no_i3 = loadStrings("no_i.txt");
   i3_alist = new ArrayList<String>(Arrays.asList(ignore_3));
   lines_alist = new ArrayList<String>(Arrays.asList(lines));
   lines5_alist = new ArrayList<String>(Arrays.asList(lines5));
   i5_alist = new ArrayList<String>(Arrays.asList(ignore_5));
   no_i3_alist = new ArrayList<String>(Arrays.asList(no_i3));
   userTB = new TEXTBOX();
   userTB.X = width - 460;
   userTB.Y = 10;
   userTB.W = 450;
   userTB.H = 35;
   tb2 = new TEXTBOX();
   tb2.X = width - 50;
   tb2.Y = userTB.Y + userTB.H + 450;
   tb2.W = 40;
   tb2.H = 40;
   
   textboxes.add(userTB);
   textboxes.add(tb2);
   int[] starting_rule = new int[8];
   for (int i = 0; i < 8; i++) {
      starting_rule[i] = 0; 
   }
   ca = new CA(starting_rule);
   ca.neighbors = 3;
   rect_3 = new Rect(width - 50, userTB.Y + userTB.H + 20, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_5 = new Rect(width - 50, userTB.Y + userTB.H + 70, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_r = new Rect(width - 50, userTB.Y + userTB.H + 120, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_h = new Rect(width - 50, userTB.Y + userTB.H + 170, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_n = new Rect(width - 50, userTB.Y + userTB.H + 220, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_i3 = new Rect(width - 50, userTB.Y + userTB.H + 280, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_i5 = new Rect(width - 50, userTB.Y + userTB.H + 330, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_i = new Rect(width - 50, userTB.Y + userTB.H + 390, 40, 40, color(0), color(87), color(51), color(102), false);
   style = new Rect(width - 50, userTB.Y + userTB.H + 20, 40, 240, color(0), color(87), color(51), color(102), false);
   style2 = new Rect(width - 50, userTB.Y + userTB.H + 280, 40, 70, color(0), color(87), color(51), color(102), false);
   rect_n2 = new Rect(width - 50, userTB.Y + userTB.H + 510, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_n3 = new Rect(width - 50, userTB.Y + userTB.H + 560, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_n4 = new Rect(width - 50, userTB.Y + userTB.H + 610, 40, 40, color(0), color(87), color(51), color(102), false);
   rect_n5 = new Rect(width - 50, userTB.Y + userTB.H + 660, 40, 40, color(0), color(87), color(51), color(102), false);
   style3 = new Rect(width - 50, userTB.Y + userTB.H + 510, 40, 190, color(0), color(87), color(51), color(102), false);
   style.ignore = true;
   style2.ignore = true;
   style3.ignore = true;
   rects.add(style);
   rects.add(style3);
   rects.add(style2);
   rects.add(rect_3);
   rects.add(rect_5);
   rects.add(rect_r);
   rects.add(rect_h);
   rects.add(rect_n);
   rects.add(rect_i3);
   rects.add(rect_i5);
   rects.add(rect_i);
   rects.add(rect_n2);
   rects.add(rect_n3);
   rects.add(rect_n4);
   rects.add(rect_n5);
   background(0);
}

void draw() {   
   // LABELS
   for (Rect r: rects) {
     r.update();
   }
   fill(250, 250, 250);
   
   // DRAW THE TEXTBOXES
   userTB.DRAW();
   tb2.DRAW();
   tb2.maxLen = 1;
   if (ca.neighbors == 3) {
     checkLine3();
   } else if (ca.neighbors == 5) {
     checkLine5();
   }
   checkIgnore();
   ca.render();
   ca.generate();
   fill(0);
   for (Rect r: rects) {
     r.draw_rect();
   }
   draw_text();
}

void checkLine3() {
  if (ca.generation < 80 && ca.generation > 20) {
    line[ca.generation - 21] = ca.cells[5];
  }
  if (ca.generation > 80 && ca.is_line == false) {
    for (int i = 1; i < line.length; i++) {
      if (line[i-1] != line[i]) {
        return;
      }
    }
    String str = "";
         for(int j=0;j<ca.rule.length;j++) {
            str = str + Integer.toString(ca.rule[j]);
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
  if (ca.generation < 80 && ca.generation > 20) {
    line[ca.generation - 21] = ca.cells[5];
  }
  if (ca.generation > 80 && ca.is_line == false) {
    for (int i = 1; i < line.length; i++) {
      if (line[i-1] != line[i]) {
        return;
      }
    }
    String str = "";
         for(int j=0;j<ca.rule.length;j++) {
            str = str + Integer.toString(ca.rule[j]);
         }
    lines5_alist.add(str);
    Object[] o = lines5_alist.toArray();
    String[] temp = Arrays.copyOf(o, o.length, String[].class);
    lines5 = temp;
    saveStrings("lines5.txt", lines5);
    ca.is_line = true;
  }
}

void checkIgnore() {
  if (!ca.is_search) {
    if (ca.neighbors == 3 && !ca.is_i3) {
      String str = "";
         for(int j=0;j<ca.rule.length;j++) {
            str = str + Integer.toString(ca.rule[j]);
         }
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
   } else if (ca.neighbors == 5 && !ca.is_i5) {
     String str = "";
         for(int j=0;j<ca.rule.length;j++) {
            str = str + Integer.toString(ca.rule[j]);
         }
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
   if (rect_i.rectOver && ca.rule.length == 32 && ca.is_i5) { 
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
    ca.is_line = false;
    ca.start_over();
  } else if (rect_i.rectOver && ca.rule.length == 8 && ca.is_i3) { 
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
    ca.start_over();
  } else if (rect_i.rectOver && ca.rule.length == 32 && !ca.is_i5 && !ca.is_i3) { 
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
    saveStrings("data_5.txt", ignore_5);
    ca.start_over();
  } else if (rect_i.rectOver && ca.rule.length == 8 && !ca.is_i5 && !ca.is_i3) { 
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
    saveStrings("data_3.txt", ignore_3);
    ca.start_over();
  } else if (rect_i5.rectOver && ca.rule.length == 32 && ca.is_i5) { 
    ca.is_search = false;
    rect_i5.currentColor = rect_i5.rectColor;
    ca.is_i5 = false;
    for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = floor(random(2));
    }
    ca.is_line = false;
    ca.start_over();
  } else if (rect_i5.rectOver) { 
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
    ca.neighbors = 5;
    ca.start_over();
  } else if (rect_i3.rectOver && ca.rule.length == 8 && ca.is_i3) { 
    ca.is_search = false;
    rect_i3.currentColor = rect_i3.rectColor;
    ca.is_i3 = false;
    for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = floor(random(2));
    }
    ca.is_line = false;
    ca.start_over();
  } else if (rect_i3.rectOver) { 
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
    ca.neighbors = 3;
    ca.start_over();
  } else if (rect_3.rectOver) {
    ca.is_search = false;
    ca.is_i3 = false;
    ca.is_i5 = false;
    rect_3.currentColor = rect_3.rectColor;
    ca.neighbors = 3;
    userTB.maxLen = 1;
    if (ca.rule.length != 8) { 
      ca.rule = new int[8];
      for (int i = 0; i < ca.rule.length; i++) {
          ca.rule[i] = floor(random(2));
      }
    }
    ca.is_line = false;
    ca.start_over();
  } else if (rect_5.rectOver) {
    ca.is_i3 = false;
    ca.is_i5 = false;
    ca.is_search = false;
    rect_5.currentColor = rect_5.rectColor;
    ca.neighbors = 5;
    userTB.maxLen = 7;
    if (ca.rule.length != 32) {
      ca.rule = new int[32];
      for (int i = 0; i < ca.rule.length; i++) {
          ca.rule[i] = floor(random(2));
      }
    }
    ca.is_line = false;
    ca.start_over();
  } else if (rect_r.rectOver) {
    rect_r.currentColor = rect_r.rectColor;
    ca.rand = 0;
    ca.start_over();
  } else if (rect_h.rectOver) {
    rect_h.currentColor = rect_h.rectColor;
    ca.rand = 1;
    ca.start_over();
  } else if (rect_n2.rectOver) {
    ca.rand = 2;
    ca.start_over();
  } else if (rect_n3.rectOver) {
    ca.rand = 3;
    ca.start_over();
  } else if (rect_n4.rectOver) {
    ca.rand = 4;
    ca.start_over();
  } else if (rect_n5.rectOver) {
    rect_h.currentColor = rect_h.rectColor;
    ca.rand = 5;
    ca.start_over();
  } else if (rect_n.rectOver && ca.is_i3) {
    ca.is_search = false;
    String temp = ignore_3[floor(random(ignore_3.length))];
    for (int i = 0; i < temp.length(); i++) {
        ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = false;
    ca.start_over();
  } else if (rect_n.rectOver && ca.is_i5) {
    ca.is_search = false;
    String temp = ignore_5[floor(random(ignore_5.length))];
    for (int i = 0; i < temp.length(); i++) {
      ca.rule[i] = temp.charAt(i) - '0';
    }
    ca.is_line = false;
    ca.start_over();
  } else if (rect_n.rectOver) {
    ca.is_search = false;
    rect_n.currentColor = rect_n.rectColor;
    for (int i = 0; i < ca.rule.length; i++) {
      ca.rule[i] = floor(random(2));
    }
    ca.is_line = false;
    ca.start_over();
  }
}

void keyPressed() {
  for (TEXTBOX t : textboxes) {
      t.KEYPRESSED(key, (int)keyCode);
   }
  if (key == '\n' && tb2.Text.length() > 0 && tb2.Text.length() < 3 && int(tb2.Text) > 0 && int(tb2.Text) < 70) {
    background(0);
    ca.resolution = int(tb2.Text);
    ca.cells = new int[width/ca.resolution];
    ca.start_over();
    ca.is_search = false;
    tb2.Text = "";
    tb2.TextLength = 0;
  } else if (key == '\n' && userTB.Text.length() == 2 && (userTB.Text.toUpperCase().matches("[A-F0-9]+"))) {
    background(0);
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
    ca.is_search = true;
    userTB.Text = "";
    userTB.TextLength = 0;
    ca.start_over();
  } else if (key == '\n' && userTB.Text.length() == 8 && (userTB.Text.toUpperCase().matches("[A-F0-9]+"))) {
    background(0);
    ca.is_search = true;
    ca.is_i3 = false;
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

void draw_text() {
  String[] str_rule = new String[8];
  if (ca.neighbors == 3) {
    str_rule = new String[8];
    for (int i = 0; i < ca.rule.length; i++) {
        str_rule[i] = str(ca.rule[i]);
    }
  } else if (ca.neighbors == 5) {
    str_rule = new String[32];
    for (int i = 0; i < ca.rule.length; i++) {
        str_rule[i] = str(ca.rule[i]);
    }
  } if (ca.rand == 0) {
    textSize(20);
    fill(255);
    text("Random Rule", width / 4 + 160, userTB.Y + 24);
  } else if (ca.rand == 1) {
    textSize(20);
    fill(255);
    text("Non-random Rule", width / 4 + 160, userTB.Y + 24);
  } if (ca.is_i3 == true) {
    textSize(20);
    fill(255);
    text("Ignore 3", width / 4 + 350, userTB.Y + 24);
  } else if (ca.is_i5 == true) {
    textSize(20);
    fill(255);
    text("Ignore 5", width / 4 + 350, userTB.Y + 24);
  } 
  String t = join(str_rule, "");
  t = t.replaceAll("....", "$0 ");
  textSize(20);
  fill(255);
  text("Rule: " + t, 20, userTB.Y + 24); 
  text("Hex Input: ", width - 570, userTB.Y + 24); 
  text(ca.neighbors + " Neighbors", width / 2, userTB.Y + 24);
  text("3", rect_3.rectX + rect_3.rectW/2 - 7, rect_3.rectY+rect_3.rectH/2 + 5); 
  text("5", rect_5.rectX + rect_5.rectW/2 - 7, rect_5.rectY+rect_5.rectH/2 + 5); 
  text("r", rect_r.rectX + rect_r.rectW/2 - 7, rect_r.rectY+rect_r.rectH/2 + 5); 
  text("h", rect_h.rectX + rect_h.rectW/2 - 7, rect_h.rectY+rect_h.rectH/2 + 5); 
  text("n", rect_n.rectX + rect_n.rectW/2 - 7, rect_n.rectY+rect_n.rectH/2 + 5); 
  text("i3", rect_i3.rectX + rect_i3.rectW/2 - 7, rect_i3.rectY+rect_i3.rectH/2 + 5); 
  text("i5", rect_i5.rectX + rect_i5.rectW/2 - 7, rect_i5.rectY+rect_i5.rectH/2 + 5); 
  text("i", rect_i.rectX + rect_i.rectW/2 - 7, rect_i.rectY+rect_i.rectH/2 + 5); 
  text("n2", rect_n2.rectX + rect_n2.rectW/2 - 10, rect_n2.rectY+rect_n2.rectH/2 + 5); 
  text("n3", rect_n3.rectX + rect_n3.rectW/2 - 10, rect_n3.rectY+rect_n3.rectH/2 + 5); 
  text("n4", rect_n4.rectX + rect_n4.rectW/2 - 10, rect_n4.rectY+rect_n4.rectH/2 + 5); 
  text("n5", rect_n5.rectX + rect_n5.rectW/2 - 10, rect_n5.rectY+rect_n5.rectH/2 + 5); 
}
