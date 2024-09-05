class Casa {
  float x, y;
  float ancho, alto;
  color colorBase;
  boolean interior = false;
  PImage imagenDueño;
  String texto="";

  Casa(float posX, float posY, float w, float h, color unColor) {
    x = posX;
    y = posY;
    ancho = w;
    alto = h;
    colorBase = unColor;
  }

  void setDueño(PImage imagen, String texto) {
    imagenDueño = imagen;
    this.texto = texto;
  }
  void mostrarInterior() {
    interior=true;
  }
  void ocultarInterior() {
    interior=false;
  }

  void mostrarTexto() {
    push();
    strokeWeight(5);
    stroke(colorBase);
    textSize(24);
    fill(178);
    rect(100, 100, 600, 400);
    fill(255);
    text(texto, 150, 200, 500, 300);
    pop();
    image(imagenDueño, 560, 340, 100, 130);
  }

  void mostrar() {
    strokeWeight(5);
    stroke(colorBase);
    fill(colorBase, 128);
    rect(x, y, ancho, alto);
  }
}
