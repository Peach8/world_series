class VisualizationManager {
  TitlePage title;

  VisualizationManager() {
    title = new TitlePage();
    myLayout = new Layout();
    teams = new Teams();
    years = new Years();
  }

  void displayTitlePage() {
    title.pageLayout();
  }
  
  void switchControl() {
    title.clickHere(); 
  }

  void displayVisualization() {
    myLayout.display();
    years.display();
    teams.display();
  }
}

