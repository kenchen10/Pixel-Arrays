import java.util.Arrays; 
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
TEXTBOX userTB;
TEXTBOX tb2;
boolean logged = false;

CA ca;
String typing = "";
String saved = "";

Rect rect_3;
Rect rect_5;
Rect rect_r;
Rect rect_h;
Rect rect_n;

void startScreen(int remainingTimeMs){
  background(50);
  textSize(100);
  fill(0);
  textAlign(CENTER,CENTER);
  // Show the remaining time, in seconds;
  // show n when there are n or fewer seconds remaining. 
  text(ceil(remainingTimeMs/1000.0), width/2, height/2);
}

void settings() {
   size(2000, 1300);
}

void setup() {
   // USERNAME TEXTBOX
   // CONFIGURED USING THE GLOBAL VARS
   userTB = new TEXTBOX();
   userTB.X = width - 460;
   userTB.Y = 10;
   userTB.W = 450;
   userTB.H = 35;
   
   tb2 = new TEXTBOX();
   tb2.X = width - 50;
   tb2.Y = userTB.Y + userTB.H + 260;
   tb2.W = 40;
   tb2.H = 40;
   
   textboxes.add(userTB);
   textboxes.add(tb2);
   int[] starting_rule = {0,0,0,0,0,0,0,0};
   ca = new CA(starting_rule);
   ca.neighbors = 3;
   rect_3 = new Rect(width - 50, userTB.Y + userTB.H + 10, 40, color(0), color(102), color(51), color(102), false);
   rect_5 = new Rect(width - 50, userTB.Y + userTB.H + 60, 40, color(0), color(102), color(51), color(102), false);
   rect_r = new Rect(width - 50, userTB.Y + userTB.H + 110, 40, color(0), color(102), color(51), color(102), false);
   rect_h = new Rect(width - 50, userTB.Y + userTB.H + 160, 40, color(0), color(102), color(51), color(102), false);
   rect_n = new Rect(width - 50, userTB.Y + userTB.H + 210, 40, color(0), color(102), color(51), color(102), false);
   background(0);
}

void draw() {   
   // LABELS
   rect_3.update();
   rect_5.update();
   rect_r.update();
   rect_h.update();
   rect_n.update();
   fill(250, 250, 250);
   
   // DRAW THE TEXTBOXES
   userTB.DRAW();
   tb2.DRAW();
   tb2.maxLen = 1;
   ca.render();
   ca.generate();
   fill(0);
   draw_text();
   rect_3.draw_rect();
   rect_5.draw_rect();
   rect_r.draw_rect();
   rect_h.draw_rect();
   rect_n.draw_rect();
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
   }
  if (rect_3.rectOver) {
    rect_3.currentColor = rect_3.rectColor;
    ca.neighbors = 3;
    userTB.maxLen = 7;
    if (ca.rule.length != 8) { 
      ca.rule = new int[8];
      for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = floor(random(2));
      }
    }
    ca.start_over();
  } else if (rect_5.rectOver) {
    rect_5.currentColor = rect_5.rectColor;
    ca.neighbors = 5;
    userTB.maxLen = 31;
    if (ca.rule.length != 32) {
      ca.rule = new int[32];
      for (int i = 0; i < ca.rule.length; i++) {
        ca.rule[i] = floor(random(2));
      }
    }
    ca.start_over();
  } else if (rect_r.rectOver) {
    rect_r.currentColor = rect_r.rectColor;
    ca.rand = 0;
    ca.start_over();
  } else if (rect_h.rectOver) {
    rect_h.currentColor = rect_h.rectColor;
    ca.rand = 1;
    ca.start_over();
  } else if (rect_n.rectOver) {
    rect_n.currentColor = rect_n.rectColor;
    for (int i = 0; i < ca.rule.length; i++) {
      ca.rule[i] = floor(random(2));
    }
    ca.start_over();
  }
}

String decToBinary(int n, int size) {
    int[] binaryNum = new int[size];

    int i = 0;
    while (n > 0) {
      binaryNum[i] = n % 2;
      n = n / 2;
      i++;
      System.out.println(binaryNum[i]);
    }
    return Arrays.toString(binaryNum);
}

void Submit() {
   if (textboxes.get(0).Text.equals("mitkonikov")) {
      if (textboxes.get(1).Text.equals("test1234")) {
         logged = true;
      } else {
         logged = false;
      }
   } else {
      logged = false;
   }
}

void keyPressed() {
  for (TEXTBOX t : textboxes) {
      if (t.KEYPRESSED(key, (int)keyCode)) {
         Submit();
      }
   }
  if (key == '\n' && tb2.Text.length() > 0 && tb2.Text.length() < 3) {
    background(0);
    ca.resolution = int(tb2.Text);
    ca.cells = new int[width/ca.resolution - 54/ca.resolution];
    ca.start_over();
    //ca.resolution = int(tb2.Text);
    tb2.Text = "";
    tb2.TextLength = 0;
  } else if (key == '\n' && userTB.Text.length() == 8) {
    background(0);
    saved = typing;
    typing = ""; 
    for (int i = 0; i < userTB.Text.length(); i++) {
       ca.rule[i] = userTB.Text.charAt(i)-'0';
    }
    userTB.Text = "";
    userTB.TextLength = 0;
    ca.start_over();
  } else if (key == '\n' && userTB.Text.length() == 32) {
    background(0);
    saved = typing;
    typing = ""; 
    for (int i = 0; i < userTB.Text.length(); i++) {
       ca.rule[i] = userTB.Text.charAt(i)-'0';
    }
    userTB.Text = "";
    userTB.TextLength = 0;
    ca.start_over();
  } else if (typing.length() < 8 && (key == '1' || key == '0') && ca.neighbors == 3) {
    typing = typing + key; 
  } else if (typing.length() < 32 && (key == '1' || key == '0') && ca.neighbors == 5) {
    typing = typing + key; 
  } 
}

void draw_text() {
  String[] str_rule = new String[8];
  if (ca.neighbors == 3) {
    str_rule = new String[8];
    for (int i = 0; i < ca.rule.length; i++) {
        str_rule[i] = str(ca.rule[i]);
    }
  } if (ca.neighbors == 5) {
    str_rule = new String[32];
    for (int i = 0; i < ca.rule.length; i++) {
        str_rule[i] = str(ca.rule[i]);
    }
  } if (ca.rand == 0) {
    textSize(20);
    fill(255);
    text("Random Rule", width / 4, userTB.Y + 24);
  } if (ca.rand == 1) {
    textSize(20);
    fill(255);
    text("Non-random Rule", width / 4, userTB.Y + 24);
  } 
  String t = join(str_rule, "");
  textSize(20);
  fill(255);
  text("Rule: " + t, 0, userTB.Y + 24); 
  text(ca.neighbors + " Neighbors", width / 2, userTB.Y + 24);
  text("3", rect_3.rectX + rect_3.rectSize/2 - 7, rect_3.rectY+rect_3.rectSize/2 + 5); 
  text("5", rect_5.rectX + rect_5.rectSize/2 - 7, rect_5.rectY+rect_5.rectSize/2 + 5); 
  text("r", rect_r.rectX + rect_r.rectSize/2 - 7, rect_r.rectY+rect_r.rectSize/2 + 5); 
  text("h", rect_h.rectX + rect_h.rectSize/2 - 7, rect_h.rectY+rect_h.rectSize/2 + 5); 
  text("n", rect_n.rectX + rect_n.rectSize/2 - 7, rect_n.rectY+rect_n.rectSize/2 + 5); 
}
