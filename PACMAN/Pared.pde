class Pared {
  float x, y; // Posición del rectángulo (esquina superior izquierda)
  float ancho, alto; // Ancho y alto del rectángulo
  
  Pared(float posX, float posY, float w, float h) {
    x = posX;
    y = posY;
    ancho = w;
    alto = h;
  }
  
  void mostrar() {
    fill(200,0,0);
    rect(x, y, ancho, alto);
  }
  
}
