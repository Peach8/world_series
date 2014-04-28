class TitlePage {
  int textFill;

  TitlePage() {
  }

  void clickHere() {
    if ((mouseX > (width/2 - 85)) && (mouseX < (width/2 + 85)) && (mouseY < 655) && (mouseY > 635)) {
      textFill = 0;
    } 
    else {
      textFill = 255;
    }
  }

  void pageLayout() {
    rectMode(CENTER);
    textAlign(CENTER);
    background(92, 183, 255); 
    noFill();
    strokeWeight(8);
    rect(width/2, height/2, width-80, height-80);
    strokeWeight(3);
    rect(width/2, height/2, width-60, height-60);
    fill(255);
    textFont(titleFont);
    text("Visualizing", width/2, 200);
    text("the", width/2, 300);
    text("World Series", width/2, 400);
    fill(0);
    text("Visualizing", width/2 + 3, 200 + 3);
    text("the", width/2 + 3, 300 + 3);
    text("World Series", width/2 + 3, 400 + 3);

    fill(255);
    strokeWeight(1);
    rect(width/2, 505, 510, 60);
    fill(92, 183, 255);
    stroke(0);
    strokeWeight(3);
    rect(width/2, 505, 500, 50);
    fill(0);
    textFont(subtitleFont);
    text("A DATA VISUALIZATION OF THE MLB WORLD SERIES USING PROCESSING", width/2, 500);
    text("CREATED BY: BRANDON T. PETERSON", width/2, 525);
    fill(textFill);
    text("CLICK HERE TO CONTINUE", width/2, 650);
  }
}

