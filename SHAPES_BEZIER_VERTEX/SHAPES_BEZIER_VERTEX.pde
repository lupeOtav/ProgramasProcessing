void setup() {
  size(400, 500);
  background(255);
  
  fill(255, 0, 0); 
  stroke(0); 
  dibujarEstrella(width/4, height/4, 50, 100, 5);
  
  fill(128, 255, 0);
  stroke(0); 
  dibujarPoligono(width/4 * 3, height/4, 6, 70);
  
  fill(0, 128, 255); 
  stroke(0); 
  dibujarCorazon(width/4, height/4 * 3, 50);
  
  fill(128, 0, 255); 
  stroke(0); 
  dibujarEstrella(width/4 * 3, height/4 * 3, 50, 100, 15);
  
}

void dibujarEstrella(float x, float y, float radio, float radio2, int puntas) {
  beginShape();
  for (int i = 0; i < puntas; i++) {
    float angulo = TWO_PI / puntas * i;
    float x1 = x + cos(angulo) * radio2;
    float y1 = y + sin(angulo) * radio2;
    vertex(x1, y1);
    angulo += HALF_PI / 2;
    x1 = x + cos(angulo) * radio;
    y1 = y + sin(angulo) * radio;
    vertex(x1, y1);
  }
  endShape(CLOSE);
}

void dibujarPoligono(float x, float y, int lados, float radio) {
  beginShape();
  for (int i = 0; i < lados; i++) {
    float angulo = TWO_PI / lados * i;
    float x1 = x + cos(angulo) * radio;
    float y1 = y + sin(angulo) * radio;
    vertex(x1, y1);
  }
  endShape(CLOSE);
}

void dibujarCorazon(float x, float y, float tamano) {
  beginShape();
  vertex(x, y - tamano * 0.7);
  bezierVertex(x - tamano * 0.9, y - tamano * 1.5, x - tamano * 2.8, y - tamano * 0.6, x, y + tamano * 1.2);
  bezierVertex(x + tamano * 2.8, y - tamano * 0.6, x + tamano * 0.9, y - tamano * 1.5, x, y - tamano * 0.7);
  endShape(CLOSE);
}
