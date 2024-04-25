int posx = 0;
int posy = 0;
int azul = 255;
int verde = 255;
boolean[] casillas = {true, true, false, true, false, true, true, true, false, false, true, false, true, true, true, false};
int casilla = 0;

void setup() {
  size(400, 400);
  background(220);
  for (int i = 100; i < 400; i += 100) {
    line(0, i, 400, i);
    line(i, 0, i, 400);
  }
  bloquearCasillas();
  ponerItems();
}

void ponerItems() {
  noStroke();
  fill(255, 255, 0);
  text("Llave", 335, 70);
  rect(335, 30, 30, 30);
  fill(255, 0, 0);
  text("Salida", 15, 375);
  rect(0, 320, 10, 60);
}

void bloquearCasillas() {
  int x = 0;
  int y = 0;
  for (int i = 0; i < 16; i++) {
    if (!casillas[i]) {
      fill(50);
      rect(x, y, 100, 100);
    }
    x += 100;
    if ((i + 1) % 4 == 0) {
      y += 100;
      x = 0;
    }
  }
}

boolean esCasillaLibre(int px, int py) {
  int x = 0;
  int y = 0;
  for (int i = 0; i < 16; i++) {
    if (!casillas[i]) {
      if (px > x - 10 && py > y - 10 && px < x + 100 && py < y + 100) {
        return false;
      }
    }
    x += 100;
    if ((i + 1) % 4 == 0) {
      y += 100;
      x = 0;
    }
  }
  return true;
}

boolean llave() {
  return (posx >= 335 && posx <= 365 && posy >= 30 && posy <= 90);
}

boolean salida() {
  return (posx >= 0 && posx <= 10 && posy >= 320 && posy <= 380);
}

void draw() {
  noStroke();
  if (llave()) {
    azul = 0;
  }
  if (salida() && azul == 0) {
    verde = 0;
  }
  if (verde == 0 && azul == 0) {
    textSize(32);
    text("Ganaste!!!!", 60, 340);
  }
  fill(255, verde, azul);
  rect(posx, posy, 10, 10);
}

void keyPressed() {
  if (keyCode == LEFT) {
    if (esCasillaLibre(posx - 10, posy)) {
      posx -= 10;
    }
  } else if (keyCode == RIGHT) {
    if (esCasillaLibre(posx + 10, posy)) {
      posx += 10;
    }
  } else if (keyCode == UP) {
    if (esCasillaLibre(posx, posy - 10)) {
      posy -= 10;
    }
  } else if (keyCode == DOWN) {
    if (esCasillaLibre(posx, posy + 10)) {
      posy += 10;
    }
  }
}
