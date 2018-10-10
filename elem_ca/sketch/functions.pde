import java.util.Arrays;
import java.lang.Integer;
import java.math.BigInteger;

// User Input
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
TEXTBOX userTB;
TEXTBOX tb2;
TEXTBOX start_box;

int counter = 0;
float percent;

String[] ignore_3;
String[] no_i3;
String[] ignore_5;
String[] lines;
int[] line;
String[] lines5;
String[] half3;
String[] half5;

ArrayList<String> i3_alist;
ArrayList<String> no_i3_alist;
ArrayList<String> i5_alist;
ArrayList<String> lines_alist;
ArrayList<String> lines5_alist;
ArrayList<String> half3_alist;
ArrayList<String> half5_alist;


boolean done_n = false;
boolean done_r = false;
boolean done_o = false;


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
Rect rect_l5;
Rect rect_l3;
Rect rect_h3;
Rect rect_h5;
Rect rect_c;

Rect b000;
Rect b001;
Rect b010;
Rect b011;
Rect b100;
Rect b101;
Rect b110;
Rect b111;
Rect start3;

Rect b1;
Rect b2;
Rect b3;
Rect b4;
Rect b5;
Rect b6;
Rect b7;
Rect b8;
Rect b9;
Rect b10;
Rect b11;
Rect b12;
Rect b13;
Rect b14;
Rect b15;
Rect b16;
Rect b17;
Rect b18;
Rect b19;
Rect b20;
Rect b21;
Rect b22;
Rect b23;
Rect b24;
Rect b25;
Rect b26;
Rect b27;
Rect b28;
Rect b29;
Rect b30;
Rect b31;
Rect b32;
Rect start5;

Rect stop;

Rect style;
Rect style2;
Rect style3;
Rect style4;

ArrayList<Rect> rects = new ArrayList<Rect>();


void load_rects() {
  rect_3 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 20, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_5 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 70, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_r = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 120, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_h = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 170, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_n = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 220, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_i3 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 280, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_i5 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 330, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_i = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 390, 40, 40, color(0), color(87), color(51), color(102), false);
  style = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 20, 40, 240, color(0), color(87), color(51), color(102), false);
  style2 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 280, 40, 70, color(0), color(87), color(51), color(102), false);
  rect_n2 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 510, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_n3 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 560, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_n4 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 610, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_n5 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 660, 40, 40, color(0), color(87), color(51), color(102), false);
  style3 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 510, 40, 190, color(0), color(87), color(51), color(102), false);
  rect_l3 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 710, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_l5 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 760, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_h3 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 810, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_h5 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 860, 40, 40, color(0), color(87), color(51), color(102), false);
  style4 = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 710, 40, 150, color(0), color(87), color(51), color(102), false);
  rect_c = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 910, 40, 40, color(0), color(87), color(51), color(102), false);
  stop = new Rect(width - 50 - width/4 + 60, userTB.Y + userTB.H + 960, 40, 40, color(0), color(87), color(51), color(102), false);

  b000 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 20, 20, 20, color(0), color(87), color(51), color(102), false);
  b001 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 45, 20, 20, color(0), color(87), color(51), color(102), false);
  b010 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 70, 20, 20, color(0), color(87), color(51), color(102), false);
  b011 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 95, 20, 20, color(0), color(87), color(51), color(102), false);
  b100 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 120, 20, 20, color(0), color(87), color(51), color(102), false);
  b101 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 145, 20, 20, color(0), color(87), color(51), color(102), false);
  b110 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 170, 20, 20, color(0), color(87), color(51), color(102), false);
  b111 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 195, 20, 20, color(0), color(87), color(51), color(102), false);
  start3 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 220, 20, 20, color(0), color(87), color(51), color(102), false);

  b1 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 20, 20, 20, color(0), color(87), color(51), color(102), false);
  b2 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 45, 20, 20, color(0), color(87), color(51), color(102), false);
  b3 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 70, 20, 20, color(0), color(87), color(51), color(102), false);
  b4 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 95, 20, 20, color(0), color(87), color(51), color(102), false);
  b5 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 120, 20, 20, color(0), color(87), color(51), color(102), false);
  b6 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 145, 20, 20, color(0), color(87), color(51), color(102), false);
  b7 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 170, 20, 20, color(0), color(87), color(51), color(102), false);
  b8 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 195, 20, 20, color(0), color(87), color(51), color(102), false);
  b9 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 220, 20, 20, color(0), color(87), color(51), color(102), false);
  b10 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 245, 20, 20, color(0), color(87), color(51), color(102), false);
  b11 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 270, 20, 20, color(0), color(87), color(51), color(102), false);
  b12 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 295, 20, 20, color(0), color(87), color(51), color(102), false);
  b13 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 320, 20, 20, color(0), color(87), color(51), color(102), false);
  b14 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 345, 20, 20, color(0), color(87), color(51), color(102), false);
  b15 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 370, 20, 20, color(0), color(87), color(51), color(102), false);
  b16 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 395, 20, 20, color(0), color(87), color(51), color(102), false);
  b17 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 420, 20, 20, color(0), color(87), color(51), color(102), false);
  b18 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 445, 20, 20, color(0), color(87), color(51), color(102), false);
  b19 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 470, 20, 20, color(0), color(87), color(51), color(102), false);
  b20 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 495, 20, 20, color(0), color(87), color(51), color(102), false);
  b21 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 520, 20, 20, color(0), color(87), color(51), color(102), false);
  b22 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 545, 20, 20, color(0), color(87), color(51), color(102), false);
  b23 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 570, 20, 20, color(0), color(87), color(51), color(102), false);
  b24 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 595, 20, 20, color(0), color(87), color(51), color(102), false);
  b25 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 620, 20, 20, color(0), color(87), color(51), color(102), false);
  b26 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 645, 20, 20, color(0), color(87), color(51), color(102), false);
  b27 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 670, 20, 20, color(0), color(87), color(51), color(102), false);
  b28 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 695, 20, 20, color(0), color(87), color(51), color(102), false);
  b29 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 720, 20, 20, color(0), color(87), color(51), color(102), false);
  b30 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 745, 20, 20, color(0), color(87), color(51), color(102), false);
  b31 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 770, 20, 20, color(0), color(87), color(51), color(102), false);
  b32 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 795, 20, 20, color(0), color(87), color(51), color(102), false);
  start5 = new Rect(width - 50 - width/7 + 60, userTB.Y + userTB.H + 820, 20, 20, color(0), color(87), color(51), color(102), false);

  style.ignore = true;
  style2.ignore = true;
  style3.ignore = true;
  rects.add(style);
  rects.add(style3);
  rects.add(style2);
  rects.add(style4);
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
  rects.add(rect_l3);
  rects.add(rect_l5);
  rects.add(rect_h3);
  rects.add(rect_h5);
  rects.add(rect_c);
  rects.add(b000);
  rects.add(b001);
  rects.add(b010);
  rects.add(b011);
  rects.add(b100);
  rects.add(b101);
  rects.add(b110);
  rects.add(b111);
  rects.add(start3);
  rects.add(b1);
  rects.add(b2);
  rects.add(b3);
  rects.add(b4);
  rects.add(b5);
  rects.add(b6);
  rects.add(b7);
  rects.add(b8);
  rects.add(b9);
  rects.add(b10);
  rects.add(b11);
  rects.add(b12);
  rects.add(b13);
  rects.add(b14);
  rects.add(b15);
  rects.add(b16);
  rects.add(b17);
  rects.add(b18);
  rects.add(b19);
  rects.add(b20);
  rects.add(b21);
  rects.add(b22);
  rects.add(b23);
  rects.add(b24);
  rects.add(b25);
  rects.add(b26);
  rects.add(b27);
  rects.add(b28);
  rects.add(b29);
  rects.add(b30);
  rects.add(b31);
  rects.add(b32);
  rects.add(start5);
  rects.add(stop);
  b000.is_3 = true;
  b001.is_3 = true;
  b010.is_3 = true;
  b011.is_3 = true;
  b100.is_3 = true;
  b101.is_3 = true;
  b110.is_3 = true;
  b111.is_3 = true;
  start3.is_3 = true;

  b1.is_5 = true;
  b2.is_5 = true;
  b3.is_5 = true;
  b4.is_5 = true;
  b5.is_5 = true;
  b6.is_5 = true;
  b7.is_5 = true;
  b8.is_5 = true;
  b9.is_5 = true;
  b10.is_5 = true;
  b11.is_5 = true;
  b12.is_5 = true;
  b13.is_5 = true;
  b14.is_5 = true;
  b15.is_5 = true;
  b16.is_5 = true;
  b17.is_5 = true;
  b18.is_5 = true;
  b19.is_5 = true;
  b20.is_5 = true;
  b21.is_5 = true;
  b22.is_5 = true;
  b23.is_5 = true;
  b24.is_5 = true;
  b25.is_5 = true;
  b26.is_5 = true;
  b27.is_5 = true;
  b28.is_5 = true;
  b29.is_5 = true;
  b30.is_5 = true;
  b31.is_5 = true;
  b32.is_5 = true;
  start5.is_5 = true;
  b1.v = 0;
  b2.v = 1;
  b3.v = 2;
  b4.v = 3;
  b5.v = 4;
  b6.v = 5;
  b7.v = 6;
  b8.v = 7;
  b9.v = 8;
  b10.v = 9;
  b11.v = 10;
  b12.v = 11;
  b13.v = 12;
  b14.v = 13;
  b15.v = 14;
  b16.v = 15;
  b17.v = 16;
  b18.v = 17;
  b19.v = 18;
  b20.v = 19;
  b21.v = 20;
  b22.v = 21;
  b23.v = 22;
  b24.v = 23;
  b25.v = 24;
  b26.v = 25;
  b27.v = 26;
  b28.v = 27;
  b29.v = 28;
  b30.v = 29;
  b31.v = 30;
  b32.v = 31;
  start3.is_start = true;
  start5.is_start = true;
}

void load_data() {
  half3 = loadStrings("half_3.txt");
  half5 = loadStrings("half_5.txt");
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
  half5_alist = new ArrayList<String>(Arrays.asList(half5));
  half3_alist = new ArrayList<String>(Arrays.asList(half3));
}


void load_input(){
  userTB = new TEXTBOX();
  userTB.X = width - 460;
  userTB.Y = 10;
  userTB.W = 450;
  userTB.H = 35;
  tb2 = new TEXTBOX();
  tb2.X = width - 50  - width/4 + 60;
  tb2.Y = userTB.Y + userTB.H + 450;
  tb2.W = 40;
  tb2.H = 40;

  start_box = new TEXTBOX();
  start_box.X = width/2 - width/20;
  start_box.Y = height/2;
  start_box.W = width/10;
  start_box.H = 50;
  start_box.maxLen = 0;

  textboxes.add(userTB);
  textboxes.add(tb2);
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
  } else if (ca.rand >= 1 && ca.rand <= 5) {
    textSize(20);
    fill(255);
    text("Non-random Rule " + ca.rand, width / 4 + 160, userTB.Y + 24);
  } if (ca.is_i3 == true) {
    textSize(20);
    fill(255);
    text("Ignore 3", width / 4 + 350, userTB.Y + 24);
  } else if (ca.is_i5 == true) {
    textSize(20);
    fill(255);
    text("Ignore 5", width / 4 + 350, userTB.Y + 24);
  } else if (ca.is_half == true && percent != 0) {
    textSize(20);
    fill(255);
    text(percent*100 +"% checkers", width / 4 + 350, userTB.Y + 24);
  } if (ca.is_half == true) {
    textSize(20);
    fill(255);
    text("checkerboard", width / 4 + 900, userTB.Y + 24);
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
  text("l3", rect_l3.rectX + rect_l3.rectW/2 - 10, rect_l3.rectY+rect_l3.rectH/2 + 5);
  text("l5", rect_l5.rectX + rect_l5.rectW/2 - 10, rect_l5.rectY+rect_l5.rectH/2 + 5);
  text("h3", rect_h3.rectX + rect_h3.rectW/2 - 10, rect_h3.rectY+rect_h3.rectH/2 + 5);
  text("h5", rect_h5.rectX + rect_h5.rectW/2 - 10, rect_h5.rectY+rect_h5.rectH/2 + 5);
  text("c", rect_c.rectX + rect_c.rectW/2 - 10, rect_c.rectY+rect_c.rectH/2 + 5);
  fill(0);
  text("3 Neighbors", rect_3.rectX + rect_3.rectW + 3, rect_3.rectY+rect_3.rectH/2 + 5);
  text("5 Neighbors", rect_5.rectX + rect_5.rectW + 3, rect_5.rectY+rect_5.rectH/2 + 5);
  text("Random", rect_r.rectX + rect_r.rectW + 3, rect_r.rectY+rect_r.rectH/2 + 5);
  text("Non-Random (Center)", rect_h.rectX + rect_h.rectW + 3, rect_h.rectY+rect_h.rectH/2 + 5);
  text("Next Pattern", rect_n.rectX + rect_n.rectW + 3, rect_n.rectY+rect_n.rectH/2 + 5);
  text("Uninteresting (3)", rect_i3.rectX + rect_i3.rectW + 3, rect_i3.rectY+rect_i3.rectH/2 + 5);
  text("Uninteresting (5)", rect_i5.rectX + rect_i5.rectW + 3, rect_i5.rectY+rect_i5.rectH/2 + 5);
  text("Add to Uninteresting", rect_i.rectX + rect_i.rectW + 3, rect_i.rectY+rect_i.rectH/2 + 5);
  text("Non-Random (2 on)", rect_n2.rectX + rect_n2.rectW + 3, rect_n2.rectY+rect_n2.rectH/2 + 5);
  text("Non-Random (3 on)", rect_n3.rectX + rect_n3.rectW + 3, rect_n3.rectY+rect_n3.rectH/2 + 5);
  text("Non-Random (4 on)", rect_n4.rectX + rect_n4.rectW + 3, rect_n4.rectY+rect_n4.rectH/2 + 5);
  text("Non-Random (5 on)", rect_n5.rectX + rect_n5.rectW + 3, rect_n5.rectY+rect_n5.rectH/2 + 5);
  text("Line Patterns (3)", rect_l3.rectX + rect_l3.rectW + 3, rect_l3.rectY+rect_l3.rectH/2 + 5);
  text("Line Patterns (5)", rect_l5.rectX + rect_l5.rectW + 3, rect_l5.rectY+rect_l5.rectH/2 + 5);
  text("Checkerboards (3)", rect_h3.rectX + rect_h3.rectW + 3, rect_h3.rectY+rect_h3.rectH/2 + 5);
  text("Checkerboards (5)", rect_h5.rectX + rect_h5.rectW + 3, rect_h5.rectY+rect_h5.rectH/2 + 5);
  text("Cycle Patterns", rect_c.rectX + rect_c.rectW + 3, rect_c.rectY+rect_c.rectH/2 + 5);
  text("Pause", stop.rectX + stop.rectW + 3, stop.rectY+stop.rectH/2 + 5);
  text("Resolution", tb2.X + tb2.W + 3, tb2.Y+tb2.H/2 + 5);
  if (ca.neighbors == 3) {
    text("000", b000.rectX + b000.rectW + 3, b000.rectY+b000.rectH/2 + 5);
    text("001", b001.rectX + b001.rectW + 3, b001.rectY+b001.rectH/2 + 5);
    text("010", b010.rectX + b010.rectW + 3, b010.rectY+b010.rectH/2 + 5);
    text("011", b011.rectX + b011.rectW + 3, b011.rectY+b011.rectH/2 + 5);
    text("100", b100.rectX + b100.rectW + 3, b100.rectY+b100.rectH/2 + 5);
    text("101", b101.rectX + b101.rectW + 3, b101.rectY+b101.rectH/2 + 5);
    text("110", b110.rectX + b110.rectW + 3, b110.rectY+b110.rectH/2 + 5);
    text("111", b111.rectX + b111.rectW + 3, b111.rectY+b111.rectH/2 + 5);
    text("go", start3.rectX + start3.rectW + 3, start3.rectY+start3.rectH/2 + 5);
  }
  if (ca.neighbors == 5) {
    text("00000", b1.rectX + b1.rectW + 3, b1.rectY+b1.rectH/2 + 5);
    text("00001", b2.rectX + b2.rectW + 3, b2.rectY+b2.rectH/2 + 5);
    text("00010", b3.rectX + b3.rectW + 3, b3.rectY+b3.rectH/2 + 5);
    text("00011", b4.rectX + b4.rectW + 3, b4.rectY+b4.rectH/2 + 5);
    text("00100", b5.rectX + b5.rectW + 3, b5.rectY+b5.rectH/2 + 5);
    text("00101", b6.rectX + b6.rectW + 3, b6.rectY+b6.rectH/2 + 5);
    text("00110", b7.rectX + b7.rectW + 3, b7.rectY+b7.rectH/2 + 5);
    text("00111", b8.rectX + b8.rectW + 3, b8.rectY+b8.rectH/2 + 5);
    text("01000", b9.rectX + b9.rectW + 3, b9.rectY+b9.rectH/2 + 5);
    text("01001", b10.rectX + b10.rectW + 3, b10.rectY+b10.rectH/2 + 5);
    text("01010", b11.rectX + b11.rectW + 3, b11.rectY+b11.rectH/2 + 5);
    text("01011", b12.rectX + b12.rectW + 3, b12.rectY+b12.rectH/2 + 5);
    text("01100", b13.rectX + b13.rectW + 3, b13.rectY+b13.rectH/2 + 5);
    text("01101", b14.rectX + b14.rectW + 3, b14.rectY+b14.rectH/2 + 5);
    text("01110", b15.rectX + b15.rectW + 3, b15.rectY+b15.rectH/2 + 5);
    text("01111", b16.rectX + b16.rectW + 3, b16.rectY+b16.rectH/2 + 5);
    text("10000", b17.rectX + b17.rectW + 3, b17.rectY+b17.rectH/2 + 5);
    text("10001", b18.rectX + b18.rectW + 3, b18.rectY+b18.rectH/2 + 5);
    text("10010", b19.rectX + b19.rectW + 3, b19.rectY+b19.rectH/2 + 5);
    text("10011", b20.rectX + b20.rectW + 3, b20.rectY+b20.rectH/2 + 5);
    text("10100", b21.rectX + b21.rectW + 3, b21.rectY+b21.rectH/2 + 5);
    text("10101", b22.rectX + b22.rectW + 3, b22.rectY+b22.rectH/2 + 5);
    text("10110", b23.rectX + b23.rectW + 3, b23.rectY+b23.rectH/2 + 5);
    text("10111", b24.rectX + b24.rectW + 3, b24.rectY+b24.rectH/2 + 5);
    text("11000", b25.rectX + b25.rectW + 3, b25.rectY+b25.rectH/2 + 5);
    text("11001", b26.rectX + b26.rectW + 3, b26.rectY+b26.rectH/2 + 5);
    text("11010", b27.rectX + b27.rectW + 3, b27.rectY+b27.rectH/2 + 5);
    text("11011", b28.rectX + b28.rectW + 3, b28.rectY+b28.rectH/2 + 5);
    text("11100", b29.rectX + b29.rectW + 3, b29.rectY+b29.rectH/2 + 5);
    text("11101", b30.rectX + b30.rectW + 3, b30.rectY+b30.rectH/2 + 5);
    text("11110", b31.rectX + b31.rectW + 3, b31.rectY+b31.rectH/2 + 5);
    text("11111", b32.rectX + b32.rectW + 3, b32.rectY+b32.rectH/2 + 5);
    text("go", start5.rectX + start5.rectW + 3, start5.rectY+start5.rectH/2 + 5);
  }
}
