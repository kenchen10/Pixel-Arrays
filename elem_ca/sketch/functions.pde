import java.util.Arrays;
import java.lang.Integer;
import java.math.BigInteger;

// User Input
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
TEXTBOX userTB;
TEXTBOX tb2;
TEXTBOX start_box;

int counter = 0;

String[] ignore_3;
String[] no_i3;
String[] ignore_5;
String[] lines;
int[] line = new int[60];
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


Rect style;
Rect style2;
Rect style3;

ArrayList<Rect> rects = new ArrayList<Rect>();


void load_rects() {
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
  rect_l3 = new Rect(width - 50, userTB.Y + userTB.H + 710, 40, 40, color(0), color(87), color(51), color(102), false);
  rect_l5 = new Rect(width - 50, userTB.Y + userTB.H + 760, 40, 40, color(0), color(87), color(51), color(102), false);
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
  rects.add(rect_l3);
  rects.add(rect_l5);
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
  tb2.X = width - 50;
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
