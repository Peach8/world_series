// Visualizing the World Series
// Brandon Peterson
// All team logos retreived from http://www.sportslogos.net
// Background image retrieved from http://ghostsofdc.org/2012/08/29/babe-ruth-last-home-run-yankees/

color loseColor;
color winColor;
color textColor;
PFont tinyFont;
PFont smallFont;
PFont medFont;
PFont largeFont;

Layout myLayout;
Teams teams;
Years years;


void setup() {
  size(1171, 800, OPENGL);
  //smooth();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  tinyFont = loadFont("AmericanTypewriter-Bold-16.vlw");
  smallFont = loadFont("AmericanTypewriter-Bold-20.vlw");
  medFont = loadFont("AmericanTypewriter-Bold-36.vlw");
  largeFont = loadFont("AmericanTypewriter-Bold-150.vlw");
  loseColor = color(231, 76, 60, 175);
  //loseColor = color(255, 89, 82, 175);
  winColor = color(52, 152, 219, 175);
  //winColor = color(79, 170, 201, 175);
  //textColor = color(236, 240, 241);
  textColor = color(252, 238, 201, 210);
  
  myLayout = new Layout();
  teams = new Teams();
  years = new Years();
}

void draw() {
  myLayout.display();
  teams.display();
  years.display();
  //println(mouseX, mouseY);
}

