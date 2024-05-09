boolean[] color1 = new boolean[9];
boolean[] casillas = new boolean[9];
boolean jugador1 = true;
boolean hayGanador = false;
PImage tablero;

void setup() {
  size(450, 550);
  inicializarCasillas();
  tablero = loadImage("tablero.jpg");
}

void draw() {
  background(190);
  image(tablero, 0, 0, 450, 550);

  dibujarCasillasOcupadas();
  dibujarBotonReiniciar();
}

void tocarCasilla(int i, int x, int y, int ancho, int alto) {
  if (mouseX>x && mouseX <x+ancho && mouseY>y && mouseY<y+alto) {
    if (casillas[i]) {//si toque una csilla ocupada no hago nada
      return;
    }
    if (!hayGanador) {
      casillas[i] = true;
      color1[i] = jugador1;
      jugador1 = !jugador1;
    }
  }
}
void mousePressed() {
  tocarCasilla(0, 100, 125, 80, 80);
  tocarCasilla(1, 185, 125, 80, 80);
  tocarCasilla(2, 270, 125, 80, 80);

  tocarCasilla(3, 90, 210, 90, 95);
  tocarCasilla(4, 185, 210, 80, 95);
  tocarCasilla(5, 270, 210, 90, 95);

  tocarCasilla(6, 80, 310, 95, 105);
  tocarCasilla(7, 180, 310, 90, 105);
  tocarCasilla(8, 275, 310, 95, 105);

  if (mouseY>450) {
    inicializarCasillas();
  }

  chequearLinea();
  chequearFindeJuego();
}

void dibujarCasillasOcupadas() {
  chequearyDibujar(0, 120, 145);
  chequearyDibujar(1, 205, 145);
  chequearyDibujar(2, 290, 145);
  chequearyDibujar(3, 110, 230);
  chequearyDibujar(4, 205, 230);
  chequearyDibujar(5, 290, 230);
  chequearyDibujar(6, 100, 330);
  chequearyDibujar(7, 200, 330);
  chequearyDibujar(8, 295, 330);
}

void chequearFindeJuego() {
  if (hayGanador) {
    if (jugador1) {
      println("ganó el jugador violeta" );
    } else {
      println("ganó el jugador verde" );
    }
  } else {
    if (termino()) {
      println("hay empate" );
    }
  }
}

boolean termino() {
  for (int i=0; i<9; i++) {
    if (!casillas[i]) {
      return false;
    }
  }
  return true;
}

void chequearyDibujar(int i, int x, int y) {
  if (casillas[i]) {
    colorJugador(i);
    rect(x, y, 40, 40);
  }
}

void chequearLinea() {
  linea(0, 1, 2);
  linea(3, 4, 5);
  linea(6, 7, 8);
  linea(0, 4, 8);
  linea(2, 4, 6);
  linea(0, 3, 6);
  linea(1, 4, 7);
  linea(2, 5, 8);
}

void dibujarBotonReiniciar() {
  line(0, 450, 450, 450);
  fill(0);
  textSize(32);
  text("reiniciar", 300, 480);
}

void linea(int a, int b, int c) {
  if (casillas[a] && casillas[b] && casillas[c] && color1[a] == color1[b] && color1[a] == color1[c]) {
    hayGanador = true;
  }
}

void inicializarCasillas() {
  for (int i=0; i<9; i++) {
    casillas[i] = false;
    color1[i] = false;
  }
  jugador1 = true;
  hayGanador = false;
}

void colorJugador(int i) {
  if (color1[i]) {
    fill(0, 255, 0);
  } else {
    fill(105, 0, 255);
  }
}
