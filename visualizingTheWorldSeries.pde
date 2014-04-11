// Visualizing the World Series
// Brandon Peterson
// All team logos retreived from http://www.sportslogos.net
// Background image retrieved from http://ghostsofdc.org/2012/08/29/babe-ruth-last-home-run-yankees/

color loseColor;
color winColor;
color yearTextColor;
color otherTextColor;
PFont font14;
PFont font16;
PFont font20;
PFont font24;
PFont font36;
PFont font150;

Layout myLayout;
Teams teams;
Years years;


void setup() {
  size(1171, 800, OPENGL);
  //smooth();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  font14 = loadFont("AmericanTypewriter-Bold-14.vlw");
  font16 = loadFont("AmericanTypewriter-Bold-16.vlw");
  font20 = loadFont("AmericanTypewriter-Bold-20.vlw");
  font24 = loadFont("AmericanTypewriter-Bold-24.vlw");
  font36 = loadFont("AmericanTypewriter-Bold-36.vlw");
  font150 = loadFont("AmericanTypewriter-Bold-150.vlw");
  loseColor = color(250, 114, 114, 220);
  winColor = color(92, 183, 255, 175);
  yearTextColor = color(255, 200);
  otherTextColor = color(241, 235, 143);
  
  
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

