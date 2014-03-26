class Years {
  Table table;
  Year[] years;

  //float textWidth;

  // calculate our "bin" widths (sketch width/20 slots)
  int binWidth = width/20;
  int halfBinWidth = binWidth/2;
  int binRowSpacing = 30;
  int dateBarOffset = 80;

  Years() {
    table = loadTable("years.csv", "header");
    years = new Year[111];
    for (int i = 0; i < years.length; i++) {
      TableRow row = table.getRow(i);
      int id = row.getInt("id");
      String yearName = row.getString("yearName");
      int winner = row.getInt("winner");
      int loser = row.getInt("loser");
      String gameRecord = row.getString("gameRecord");
      String mvp = row.getString("mvp");

      int binRow = floor(i / 19);
      int binColumn = i % 19; // use modulo to count by 20s
      float centerX = binWidth + (binWidth * binColumn);
      float centerY = height/2-dateBarOffset + (binRowSpacing * binRow);
      years[i] = new Year(id, yearName, winner, loser, gameRecord, mvp, centerX, centerY);
    }
  }

  void display() {
    for (int i = 0; i < years.length; i++) {
      years[i].display();
    }
  }

  void highlightWinningYear(int id) {
    for (int i = 0; i < years.length; i++) {
      if (id == i) {
        years[i].drawWin = true;
      }
    }
  }

  void highlightLosingYear(int id) {
    for (int i = 0; i < years.length; i++) {
      if (id == i) {
        years[i].drawLose = true;
      }
    }
  }
}

