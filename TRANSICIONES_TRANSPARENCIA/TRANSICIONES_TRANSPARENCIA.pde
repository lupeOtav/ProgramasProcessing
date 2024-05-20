PImage[] imagenes;
int alfa = 0;
int estado = 0;
int tiempoInicio;
int i = 0;
int j = 1;
int duracionTransicion = 3000;
int duracionEspera = 3000;

void setup() {
  size(450, 600);
  imagenes = new PImage[12];
  for (int a = 0; a < 12; a++) {
    imagenes[a] = loadImage("q" + a + ".jpg");
  }
  tiempoInicio = millis();
}

void draw() {
  int tiempoActual = millis();
  int tiempoTranscurrido = tiempoActual - tiempoInicio;

  switch (estado) {
  case 0: // Esperar con imagen fija
    i=j-1;
    image(imagenes[i], 0, 0, width, height);
    if (tiempoTranscurrido > duracionEspera) {
      estado = 1;
      tiempoInicio = millis();
    }
    break;

  case 1: // Transición de imagen i a imagen j
    alfa = (int) map(tiempoTranscurrido, 0, duracionTransicion, 0, 255);
    if (alfa >= 255) {
      alfa = 255;
      estado = 2;
      tiempoInicio = millis();
      i=j;
      j++;
      break;
    }
    image(imagenes[i], 0, 0, width, height);
    tint(255, alfa);
    image(imagenes[j], 0, 0, width, height);
    noTint();
    break;

  case 2: // Esperar con imagen fija
    image(imagenes[i], 0, 0, width, height);
    if (tiempoTranscurrido > duracionEspera) {
      estado = 3;
      tiempoInicio = millis();
    }
    break;

  case 3: // Transición de imagen i a imagen j
    alfa = (int) map(tiempoTranscurrido, 0, duracionTransicion, 255, 0);
    if (alfa <= 0) {
      alfa = 0;
      estado = 0;
      tiempoInicio = millis();
      i=j;
      j++;
      break;
    }
    image(imagenes[i], 0, 0, width, height);
    tint(255, 255 - alfa);
    image(imagenes[j], 0, 0, width, height);
    noTint();
    break;
  }
  if (j > imagenes.length-1) {
    i = j-1;
    j = 0;
  }

  dibujarMarco();
}

void dibujarMarco() {
  strokeWeight(3);
  stroke(255);
  noFill();
  rect(15, 15, 420, 570);
  strokeWeight(1);
  rect(20, 20, 410, 560);

  rect(5, 5, 20, 20);
  rect(425, 5, 20, 20);
  rect(5, 575, 20, 20);
  rect(425, 575, 20, 20);

  rect(25, 25, 10, 10);
  rect(415, 25, 10, 10);
  rect(25, 565, 10, 10);
  rect(415, 565, 10, 10);
}
