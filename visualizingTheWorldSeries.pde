// Visualizing the World Series
// Brandon Peterson
// All team logos retreived from http://www.sportslogos.net
// Background image retrieved from http://ghostsofdc.org/2012/08/29/babe-ruth-last-home-run-yankees/
// Link to title font: http://www.dafont.com/wolf-in-the-city.fonthttp://www.dafont.com/indy-pimp.font
// Link to subtitle font: http://www.dafont.com/indy-pimp.font

color loseColor;
color winColor;
color yearTextColor;
color otherTextColor;
PFont titleFont;
PFont subtitleFont;
PFont font14;
PFont font16;
PFont font20;
PFont font24;
PFont font36;
PFont font150;
boolean switchScreen;

Layout myLayout;
Teams teams;
Years years;
VisualizationManager myManager;


void setup() {
  size(1171, 800, OPENGL);
  //smooth();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);

  // Use createFont() with Processing 2.1.2.
  titleFont = createFont("WolfintheCity", 200);
  subtitleFont = createFont("IndyPimp", 18);
  font14 = createFont("AmericanTypewriter-Bold", 14);
  font16 = createFont("AmericanTypewriter-Bold", 16);
  font20 = createFont("AmericanTypewriter-Bold", 20);
  font24 = createFont("AmericanTypewriter-Bold", 24);
  font36 = createFont("AmericanTypewriter-Bold", 36);
  font150 = createFont("AmericanTypewriter-Bold", 150);

  /* 
   Use loadFont() to include .vlw files in sketch folder.
   
   I don't know if you (Joseph) still have to have the fonts download on your cpu.
   If so, I've included the urls above.
   
   titleFont = loadFont("WolfintheCity-200.vlw");
   subtitleFont = loadFont("IndyPimp-18.vlw");
   font14 = loadFont("AmericanTypewriter-Bold-14.vlw");
   font16 = loadFont("AmericanTypewriter-Bold-16.vlw");
   font20 = loadFont("AmericanTypewriter-Bold-20.vlw");
   font24 = loadFont("AmericanTypewriter-Bold-24.vlw");
   font36 = loadFont("AmericanTypewriter-Bold-36.vlw");
   font150 = loadFont("AmericanTypewriter-Bold-150.vlw"); 
   */

  loseColor = color(250, 114, 114, 175);
  winColor = color(92, 183, 255, 175);
  yearTextColor = color(255, 200);
  otherTextColor = color(241, 235, 143);
  switchScreen = false;

  myManager = new VisualizationManager();
}

void mouseClicked() {
  if ((mouseX > (width/2 - 85)) && (mouseX < (width/2 + 85)) && (mouseY < 655) && (mouseY > 635)) {
    switchScreen = true;
  }
}

void draw() {
  myManager.switchControl();
  if (!switchScreen) {
    myManager.displayTitlePage();
  }
  else {
    myManager.displayVisualization();
  }
}

