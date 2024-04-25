class Boton {
  int x, y; // Posición del botón
  int ancho, alto; // Ancho y alto del botón

  // Constructor que recibe la posición en x, posición en y, ancho y alto del botón
  Boton(int posX, int posY, int w, int h) {
    x = posX;
    y = posY;
    ancho = w;
    alto = h;
  }

  // Método para verificar si se ha hecho clic en el botón
  boolean clickeado() {
    // Verifica si el mouse está dentro de los límites del botón
    if (mouseX >= x && mouseX <= x + ancho && mouseY >= y && mouseY <= y + alto) {
      // Devuelve true si se ha hecho clic en el botón
      return true;
    } else {
      // Devuelve false si no se ha hecho clic en el botón
      return false;
    }
  }

  // Método para mostrar el botón
  void mostrar() {
    // Dibuja el botón como un rectángulo
    fill(random(180, 255), random(180, 255), random(180, 255));
    rect(x, y, ancho, alto);
  }
}
