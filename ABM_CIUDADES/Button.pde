class Button {
  int x, y, ancho, alto;
  String texto;

  Button(int x, int y, int ancho, int alto, String texto) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.texto = texto;
  }

  void mostrar() {
    fill(200);
    rect(x, y, ancho, alto);
    fill(0);
    textAlign(CENTER, CENTER);
    text(texto, x + ancho/2, y + alto/2);
  }

  boolean mouseHover() {
    return (mouseX >= x && mouseX <= x + ancho && mouseY >= y && mouseY <= y + alto);
  }
}
