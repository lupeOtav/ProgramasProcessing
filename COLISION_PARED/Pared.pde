class Pared {
  float x, y;
  float ancho, alto;
  
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
