class Year {
  int id;
  String yearName;
  int winner;
  int loser;
  String gameRecord;
  String mvp;

  float centerX;
  float centerY;
  boolean hovering;
  boolean drawWin;
  boolean drawLose;

  Year(int id, String yearName, int winner, int loser, String gameRecord, 
  String mvp, float centerX, float centerY) {
    this.id = id;
    this.yearName = yearName;
    this.winner = winner;
    this.loser = loser;
    this.gameRecord = gameRecord;
    this.mvp = mvp;
    this.centerX = centerX;
    this.centerY = centerY;

    this.hovering = false;
    this.drawWin = false;
    this.drawLose = false;
  }

  void display() {
    if (drawWin) {
      drawWinYear();
    } 
    else if (drawLose) {
      drawLoseYear();
    } 
    else {
      detectMouse();
      showWinnerLoser();
      drawYear();
      drawBigYear();
      showGameRecord();
      showMVP();
    }
  }

  void detectMouse() {
    if (mouseX < centerX + 19 && mouseX > centerX - 19 && mouseY < centerY + 7 && mouseY > centerY - 7) {
      hovering = true;
    } 
    else {
      hovering = false;
    }
  }

  void drawYear() {
    textAlign(CENTER);
    if (hovering) {
      textFont(font16);
      fill(otherTextColor);
      text(yearName, centerX, centerY);
    }
    else {
      textFont(font14);
      fill(yearTextColor);
      text(yearName, centerX, centerY);
    }
  }

  void drawWinYear() {
    textAlign(CENTER);
    textFont(font16);
    fill(winColor);
    text(this.yearName, this.centerX, this.centerY);
    this.drawWin = false;
  }

  void drawLoseYear() {
    textAlign(CENTER);
    textFont(font16);
    fill(loseColor);
    text(this.yearName, this.centerX, this.centerY);
    this.drawLose = false;
  }

  void drawBigYear() {
    if (hovering) {
      textAlign(LEFT);
      textFont(font150);
      fill(0);
      text(yearName, 9, height-83);
      fill(otherTextColor);
      text(yearName, 10, height-85);
    }
  }

  void showWinnerLoser() {
    if (hovering) {
      if (this.winner != -1) {
        noStroke();
        fill(winColor);
        quad(this.centerX, this.centerY, this.centerX, this.centerY, 
        teams.getLeftCornerX(this.winner), teams.getLeftCornerY(this.winner), 
        teams.getRightCornerX(this.winner), teams.getRightCornerY(this.winner));
        teams.highlightLogoWinner(this.winner);

        fill(loseColor);
        quad(this.centerX, this.centerY, this.centerX, this.centerY, 
        teams.getLeftCornerX(this.loser), teams.getLeftCornerY(this.loser), 
        teams.getRightCornerX(this.loser), teams.getRightCornerY(this.loser));
        teams.highlightLogoLoser(this.loser);
      } 
      else {
        // what to do for -1 year
      }
    }
  }

  void showGameRecord() {
    if (hovering && !this.gameRecord.equals("-1")) {
      textAlign(LEFT);
      textFont(font36);
      fill(0);
      text("Game Record: " + this.gameRecord, 9, 112);
      fill(otherTextColor);
      text("Game Record: " + this.gameRecord, 10, 111);
    }
  }

  void showMVP() {
    if (hovering && this.mvp != "") {
      textAlign(RIGHT);
      textFont(font36);
      fill(0);
      text("MVP: " + this.mvp, width-12, height-88);
      fill(otherTextColor);
      text("MVP: " + this.mvp, width-11, height-89);
    }
  }
}

