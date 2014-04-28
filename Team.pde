class Team {
  int id;
  String teamName;
  String altName1, altName2;
  String[] winningYears, losingYears;
  String firstTeamActiveYears, secondTeamActiveYears, currentTeamActiveYears;
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
  String[] winningYears, String[] losingYears, String firstTeamActiveYears, 
  String secondTeamActiveYears, String currentTeamActiveYears, String imageName, 
  float centerX, float centerY, float leftCornerX, float leftCornerY, 
  float rightCornerX, float rightCornerY) {
    this.id = id;
    this.teamName = teamName;
    this.altName1 = altName1;
    this.altName2 = altName2;
    this.winningYears = winningYears;
    this.losingYears = losingYears;
    this.firstTeamActiveYears = firstTeamActiveYears;
    this.secondTeamActiveYears = secondTeamActiveYears;
    this.currentTeamActiveYears = currentTeamActiveYears;
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
      textFont(font36);
      fill(0);
      text(teamName + " " + currentTeamActiveYears, width-9, 111);
      fill(otherTextColor);
      text(teamName + " " + currentTeamActiveYears, width-10, 110);
      
      textFont(font24);
      fill(0);
      text(altName1 + " " + secondTeamActiveYears, width-9, 138);
      fill(otherTextColor);
      text(altName1 + " " + secondTeamActiveYears, width-10, 137);
      
      textFont(font24);
      fill(0);
      text(altName2 + " " + firstTeamActiveYears, width-10, 163);
      fill(otherTextColor);
      text(altName2 + " " + firstTeamActiveYears, width-9, 162);
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

