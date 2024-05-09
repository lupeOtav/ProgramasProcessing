class Rectangulo {
  int x, y;
  int ancho, alto;
  boolean seleccionado;
  color colorRect;
  int i = 0;
  boolean pintado = false;
int colorCode;
  // Constructor que recibe la posición en x, posición en y, ancho y alto del rectángulo
  Rectangulo(int posX, int posY, int w, int h, int i) {
    x = posX;
    y = posY;
    ancho = w;
    alto = h;
    colorRect = color(200);
    seleccionado = false;
    this.i = i;
  }
 boolean getPintado(){
  return pintado; 
 }
  int getI() {
    return i;
  }
  boolean clickeado() {
    if (mouseX >= x && mouseX <= x + ancho && mouseY >= y && mouseY <= y + alto) {
      return true;
    } else {
      return false;
    }
  }

  void mostrar() {
    if (seleccionado) {
      stroke(0, 90, 0);
      strokeWeight(2);
    } else {
      noStroke();
    }
    fill(colorRect);//random(180, 255), random(180, 255), random(180, 255));
    rect(x, y, ancho, alto);
    fill(255);
    text(i, x+10, y+10);
  }

  void seleccionado(boolean valor) {
    seleccionado = valor;
  }

  void setColor(color nuevoColor, int c) {
    colorRect = nuevoColor;
    colorCode = c;
    pintado = true;
  }
    int getColorCode() {
    return colorCode;
  }
}
