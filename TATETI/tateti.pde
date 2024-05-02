boolean[] color1 = new boolean[9];
boolean[] casillas = new boolean[9];
boolean jugador1 = true;
boolean hayGanador = false;

void setup() {
  size(450, 550);
  inicializarCasillas();
}

void draw() {
  background(190);
  dibujarGrilla();
  dibujarCasillasOcupadas();
  dibujarBotonReiniciar();
}

void mousePressed() {
  int x = 0;
  int y = 0;
  for (int i=0; i<9; i++) {
    tocarCasilla(i, x, y);
    x = x+150;
    if (x == 450) {
      x = 0;
      y = y+150;
    }
    if (mouseY>450) {
      inicializarCasillas();
    }
  }
  chequearLinea();
  chequearFindeJuego();
}

void dibujarCasillasOcupadas(){
  int x = 50;
  int y = 50;
  for (int i=0; i<9; i++) {
    colorJugador(i);
    chequearyDibujar(i, x, y);
    x = x+150;
    if (x == 500) {
      y = y+150;
      x = 50;
    }
  } 
}
void chequearFindeJuego() {
  if (hayGanador) {
    if (jugador1) {
      println("ganó el jugador amarillo" );
    } else {
      println("ganó el jugador rojo" );
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
  line(0,450,450,450);
  //fill(235, 222, 188);
  //rect(0, 450, 450, 100);
  fill(0);
  textSize(32);
  text("reiniciar", 300, 480);
}

void linea(int a, int b, int c) {
  if (casillas[a] && casillas[b] && casillas[c] && color1[a] == color1[b] && color1[a] == color1[c]) {
    hayGanador=true;
  }
}

void tocarCasilla(int i, int x, int y) {
  if (mouseX>x && mouseX <x+150 && mouseY>y && mouseY<y+150) {
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

void dibujarGrilla() {
  line(159, 0, 150, 450);
  line(300, 0, 300, 450);
  line(0, 150, 450, 150);
  line(0, 300, 450, 300);
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
    fill(255, 0, 0);
  } else {
    fill(255, 255, 0);
  }
}
