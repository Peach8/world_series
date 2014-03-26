class Team {
  int id;
  String teamName;
  String altName1, altName2;
  String[] winningYears, losingYears;
  String imageName;
  float centerX;
  float centerY;
  float leftCornerX;
  float leftCornerY;
  float rightCornerX;
  float rightCornerY;

  PImage bwImage;
  //int bwSize = 65;
  PImage colorImage;
  //int colorSize = 70;
  boolean hovering;

  Team(int id, String teamName, String altName1, String altName2, 
  String[] winningYears, String[] losingYears, String imageName, 
  float centerX, float centerY, float leftCornerX, float leftCornerY, 
  float rightCornerX, float rightCornerY) {
    this.id = id;
    this.teamName = teamName;
    this.altName1 = altName1;
    this.altName2 = altName2;
    this.winningYears = winningYears;
    this.losingYears = losingYears;
    this.imageName = imageName;
    this.bwImage = loadImage(imageName+"LogoBW.jpg");
    this.colorImage = loadImage(imageName+"LogoC.jpg");
    this.centerX = centerX;
    this.centerY = centerY;
    this.leftCornerX = leftCornerX;
    this.leftCornerY = leftCornerY;
    this.rightCornerX = rightCornerX;
    this.rightCornerY = rightCornerY;

    this.hovering = false;
  } 

  void display() {
    detectMouse();
    drawLogo();
    drawTeamNames();
    highlightWinningLosingYears();
  }

  void justHighlightLogo() {
    image(colorImage, centerX, centerY);
  }

  void detectMouse() {
    int mouseDist = (int) dist(mouseX, mouseY, centerX, centerY);
    if (mouseDist < 35) {
      hovering = true;
    } 
    else {
      hovering = false;
    }
  }

  void drawLogo() {
    if (hovering) {
      image(colorImage, centerX, centerY);
    } 
    else {
      image(bwImage, centerX, centerY);
    }
  }

  void drawTeamNames() {
    if (hovering) {
      textAlign(RIGHT);
      fill(textColor);
      textFont(medFont);
      text(teamName, width-10, 110);
      textFont(smallFont);
      text(altName1, width-10, 135);
      textFont(tinyFont);
      text(altName2, width-10, 160);
    }
  }

  void highlightWinningLosingYears() {
    if (hovering) {
      if (this.winningYears[0] != "-1" && this.losingYears[0] != "-1") {
        for (int j = 0; j < this.winningYears.length; j++) {
          years.highlightWinningYear(int (this.winningYears[j]));
        }
        for (int j = 0; j < this.losingYears.length; j++) {
          years.highlightLosingYear(int (this.losingYears[j]));
        }
      }
    }
  }
}
