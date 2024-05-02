class Nota
{
  int linea;
  float posY = 0;
  float t = 0; // Parámetro para la posición del elipse en la línea
  float x1;
  float y1;
  float x2;
  float y2;
  color colorNota;
  boolean destruir = false;
  float diametro = 20; // Tamaño inicial del diámetro del elipse

  Nota(float x1, float y1, float x2, float y2, color unColor, int linea)
  {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.colorNota = unColor;
    this.linea = linea;
  }

  boolean getDestruir() {
    return destruir;
  }

  float getPosY() {
    return posY;
  }
  void mostrar() {
    fill(colorNota);
    // Calcular las coordenadas (x, y) del elipse en función de t

    float x = lerp(x1, x2, t);
    float y = lerp(y1, y2, t);
    posY= y;
    // Dibujar el elipse en las coordenadas (x, y)
    ellipse(x, y, diametro, diametro /2);

    // Incrementar t para que el elipse se mueva a lo largo de la línea
    t += 0.005;
    diametro += 0.5;
    if (t > 1) {
      t = 0; // Reiniciar t cuando llega al final de la línea
      destruir = true;
    }
  }
}
