
class Elemento {
  String texto;
  PImage imagen;
  float x, y;

  Elemento(String texto, PImage imagen) {
    this.texto = texto;
    this.imagen = imagen;
  }

  // Muestra el elemento en la posición (x, y)
  void mostrar(float x, float y) {
    this.x = x;
    this.y = y;
    image(imagen, x, y, 200, 200); // Dibuja la imagen
    //fill(0);
    //text(texto, x + 60, y + 20); // Dibuja el texto
  }

  // Verifica si el mouse está sobre el elemento
  boolean hover() {
    return mouseX >= x && mouseX <= x + 50 && mouseY >= y && mouseY <= y + 50;
  }
}
