class Objeto {
  int x;
  int y;
  boolean visible = true;

  Objeto(int x, int y) {
    this.x=x;
    this.y=y;
  }

  void setVisible(boolean visible) {
    this.visible = visible;
  }

  boolean clikeado() {
    return (mouseX>x && mouseX<x+50 && mouseY>y && mouseY<y+50);
  }

  void mostrar() {
    if (visible) {
      fill(0);
      rect(x, y, 50, 50);
    }
  }
}
