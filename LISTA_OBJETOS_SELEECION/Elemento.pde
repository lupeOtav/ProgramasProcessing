class Elemento {
  String texto;
  PImage imagen;
  float x, y;

  Elemento(String texto, PImage imagen, float x, float y) {
    this.texto = texto;
    this.imagen = imagen;
    this.x = x;
    this.y = y;
  }

  void mostrar() {
    image(imagen, x, y); 
  }

  // Verifica si el mouse está sobre el elemento
  boolean hover() {
    return mouseX >= x && mouseX <= x + imagen.width && mouseY >= y && mouseY <= y + imagen.height;
  }
}
