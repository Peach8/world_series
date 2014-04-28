class Layout {
  PImage p1;

  Layout() {
    p1 = loadImage("theBabe.jpeg");
  }

  void display() {
    rectMode(CORNERS);
    image(p1, width/2, height/2); 

    noStroke();
    fill(65, 215);
    rect(35, 305, width-35, 475, 7);
    line(0, 77, width, 77);
    line(0, height-77, width, height-77);
    noFill();
    stroke(0);
    line(0, 0, 0, height);
    line(width, 0, width, height);
    fill(255);
    rect(0, 0, width, 77);
    rect(0, height-77, width, height);

    stroke(0);
    for (int i = 1; i <= 15; i++) {
      line((width/15)*i, 0, (width/15)*i, 77);
    }
    for (int i = 1; i <= 15; i++) {
      line((width/15)*i, height-77, (width/15)*i, height);
    }
  }
}

