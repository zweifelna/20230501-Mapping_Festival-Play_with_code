// IMPORT THE SPOUT LIBRARY
import spout.*;
// DECLARE A SPOUT OBJECT
Spout spout;


int mode=0;

float opacity = 255;
float angleStep = 0.01;
float globalScale =  1;


PImage land;
Analysor sl;
void setup() {
  //size(15000, 2000);
  
  // fullScreen(P2D,SPAN); // Modifier par Nico 20230502
  

  // PROJECTION SIZE
  size (7000, 1200, P2D);

  // WINDOW POSITION
  surface.setResizable(true);
  surface.setLocation(0, 0);

  // CREATE A NEW SPOUT OBJECT
  spout = new Spout(this);

  // GIVE THE SENDER A NAME
  // A sender can be given any name.
  // Otherwise the sketch folder name is used
  // the first time "sendTexture" is called.    
  spout.setSenderName("MappingFestival");
  
  
  
  sl = new Analysor(this, "4.mp3", 60); 
  
  //background(0);
  land = loadImage("Madonna.png");
   land.resize(1449, 805);
   imageMode(CENTER);
 
 MidiBus.list(); // List all available Midi devices

  //                      select input here
  //                        |
  myBus = new MidiBus(this, 1, 0);

  //frameRate(1000);
  setup4();
  

}

void draw() {
  
  if (millis()<600) {
    mode=1;
  } else if (millis()<30000 ) {
    mode=2;
  } else if (millis()<35000) {
    mode=4;
  } else if (millis()<50000) {
    mode=3;
  } else if (millis()<55000) {
    mode=4;
  } else if (millis()<70000) {
    mode=6;
  } else if (millis()<75000) {
    mode=4;
  } else if (millis()<90000) {
    mode=7;
  } else if (millis()<95000) {
    mode=4;
  } else if (millis()<120000) {
    mode=8;
  } else if (millis()<125000) {
    mode=4;
  } else if (millis()<145000) {
    mode=9;
  } else if (millis()<165000) {
    mode=4;
  } else if (millis()<169955 ) {  
    background(0, 15, 30);
    mode=-1;
  } else if (millis()<180000 ) {
    //background(0, 15, 30);
    mode=5;
  }

  if (mode==1) {
    draw1();
  }
  if (mode==2) {
    draw2();
  } else if (mode==3) {
    draw3();
  } else if (mode==4) {
    draw4();
  } else if (mode==5) {
    draw5();
  } else if (mode==6) {
    draw6();
  } else if (mode==7) {
    draw7();
  } else if (mode==8) {
    draw8();
  } else if (mode==9) {
    draw9();
  }



  //println(millis()+"  "+"mode : "+mode);
  
  // Send the texture of the drawing sufrface
  spout.sendTexture();
  
  //println(frameRate);
}


void keyPressed() {
  if (keyCode==LEFT)mode--;
  if (keyCode==RIGHT)mode++;
}
