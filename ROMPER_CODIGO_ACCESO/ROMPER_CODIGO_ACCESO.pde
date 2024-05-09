
Rectangulo[] rectangulos = new Rectangulo[40];
int[] aciertos = new int[10];
int p = 0;
Rectangulo seleccionadoRect = null;
int filaActual = 9; // Fila inicialmente seleccionada
int[] filaClave = new int[4];
int contadorBien=0;
boolean mostrarAyuda = true;

void setup() {
  size(410, 610);
  fill(0);
  text("En este ejemplo tenes que encontrar una clave de colores. Hay que hacer clci en una casilla de la grilla, siemrpre esta dsiponible la de mas abajo que este vacia. Si presionas en el teclado la a, s,d,w con una casilla seleccionada esta cambia de color. si logras encontrar la secuencia de colores correctos ganas", 40, 100, 310, 510);
  for (int x = 0; x < 4; x++) {
    filaClave[x] = (int) random(4); // Genera un número aleatorio entre 0 y 3
  }
  for (int i = 10; i < 240; i = i + 70) {
    for (int j = 10; j < 600; j = j + 60) {
      rectangulos[p] = new Rectangulo(i, j, 60, 50, p);
      p++;
    }
  }
  for (int j = 0; j < 10; j = j + 1) {
    aciertos[j] = 0;
    text(aciertos[j], 390, 590);
  }
}

void draw() {
  background(255);
  if (mostrarAyuda) {
    textSize(18);
    text("En este ejemplo tenes que encontrar una clave de colores. Hay que hacer click en una casilla de la grilla, siemrpre esta dsiponible la de mas abajo que este vacia. Si presionas en el teclado la a, s,d,w con una casilla seleccionada esta cambia de color. si logras encontrar la secuencia de colores correctos ganas. los numeros de la derecha te van a indicar cuantos colores correctos ingresaste una vez que termines una combinacion.", 40, 100, 310, 510);
    return;
  }
  for (int i = 0; i < 40; i++) {
    rectangulos[i].mostrar();
  }
  fill(0);
  int altura = 590;
  for (int j = 0; j < 10; j = j + 1) {
    text(aciertos[j], 290, altura);
    altura -= 60;
  }
}

void keyPressed() {
  if (seleccionadoRect != null) {
    if (key == 'a' || key == 'A') {
      seleccionadoRect.setColor(color(255, 90, 190), 0); // Rosa
    } else if (key == 'd' || key == 'D') {
      seleccionadoRect.setColor(color(50, 150, 255), 1); // Azul
    } else if (key == 's' || key == 'S') {
      seleccionadoRect.setColor(color(200, 191, 255), 2); // Lila
    } else if (key == 'w' || key == 'W') {
      seleccionadoRect.setColor(color(0, 255, 255), 3); // Cian
    }
  }
  chequearFilaCompleta();
}

void chequearFilaCompleta() {
  if (rectangulos[filaActual].getPintado() && rectangulos[filaActual + 10].getPintado() && rectangulos[filaActual + 20].getPintado() && rectangulos[filaActual + 30].getPintado()) {
    chequearClave();
    aciertos[9-filaActual] = contadorBien;
    filaActual--;
    if (filaActual<0) {
      for (int x = 0; x < 4; x++) {
        println(filaClave[x]);
      }
    }
    contadorBien=0;
  }
}

void chequearClave() {
  if (rectangulos[filaActual].getColorCode() == filaClave[0] &&
    rectangulos[filaActual +10].getColorCode() == filaClave[1] &&
    rectangulos[filaActual +20].getColorCode() == filaClave[2] &&
    rectangulos[filaActual +30].getColorCode() == filaClave[3] ) {
    println("Encontraste la clave");
    contadorBien = 4;
  } else {
    if (rectangulos[filaActual].getColorCode() == filaClave[0]) {
      contadorBien++;
    }
    if (rectangulos[filaActual +10].getColorCode() == filaClave[1]) {
      contadorBien++;
    }
    if (rectangulos[filaActual +20].getColorCode() == filaClave[2]) {
      contadorBien++;
    } else if (rectangulos[filaActual +30].getColorCode() == filaClave[3]) {
      contadorBien++;
    }
  }
  println("contadorBien: " +contadorBien + "fila actual:" + filaActual);
}

void mousePressed() {
  mostrarAyuda = false;
  for (int i = filaActual; i <= filaActual + 30; i=i+10) {
    if (rectangulos[i].clickeado()) {
      rectangulos[i].seleccionado(true);
      seleccionadoRect = rectangulos[i];
    } else {
      rectangulos[i].seleccionado(false);
    }
  }
}
