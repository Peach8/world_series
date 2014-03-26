class Teams {
  Table table;
  Team[] allTeams;

  // calculate our "bin" widths (sketch width/15 slots)
  float binWidth = width/15;
  float halfBinWidth = binWidth/2;

  Teams() {
    table = loadTable("teams.csv", "header");
    allTeams = new Team[30];
    for (int i = 0; i < 30; i++) {
      TableRow row = table.getRow(i);

      // pull a team data row from the team spreadsheet
      int id = row.getInt("id");
      String teamName = row.getString("teamName");
      String altName1 = row.getString("altName1");
      String altName2 = row.getString("altName2");
      String[] winningYears = split(row.getString("winningYears"), ' '); 
      String[] losingYears = split(row.getString("losingYears"), ' ');
      String imageName = row.getString("imageName");

      // create a team from that data

      if (i < 15) { //national league
        allTeams[i] = new Team(id, teamName, altName1, altName2, winningYears, losingYears, imageName, halfBinWidth + binWidth * i, binWidth/2, binWidth*i, binWidth, binWidth + binWidth*i, binWidth);
      } 
      else {
        allTeams[i] = new Team(id, teamName, altName1, altName2, winningYears, losingYears, imageName, halfBinWidth + binWidth * (i-15), height-binWidth/2, binWidth * (i-15), height-binWidth, binWidth + binWidth * (i-15), height-binWidth);
      }
    }
  }
  void display() {
    for (int i = 0; i < 30; i++) {
      allTeams[i].display();
    }
  }

  float getLeftCornerX(int id) {
    return allTeams[id].leftCornerX;
  }

  float getLeftCornerY(int id) {
    return allTeams[id].leftCornerY;
  }

  float getRightCornerX(int id) {
    return allTeams[id].rightCornerX;
  }

  float getRightCornerY(int id) {
    return allTeams[id].rightCornerY;
  }

  void highlightLogoWinner(int id) {
    for (int i = 0; i < allTeams.length; i++) {
      if (id == i) {
        allTeams[i].justHighlightLogo();
      }
    }
  }

  void highlightLogoLoser(int id) {
    for (int i = 0; i < allTeams.length; i++) {
      if (id == i) {
        allTeams[i].justHighlightLogo();
      }
    }
  }
}

