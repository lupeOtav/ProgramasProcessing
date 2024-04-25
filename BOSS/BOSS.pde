PImage fondo;
boolean ganar=false;
boolean morir=false;

Nave naveJugador; // Nave controlada por el jugador
NaveEnemiga naveEnemiga; // Nave enemiga

ArrayList<Disparo> disparosJugador; // Lista de disparos realizados por el jugador
ArrayList<Bomba> disparosEnemigos; // Lista de disparos realizados por la nave enemiga

void setup() {
  size(800, 600);
  textAlign(CENTER);
  textSize(16);
  fondo = loadImage("fondo.jpg");
  naveJugador = new Nave(width/2, height - 50, color(255, 80, 90)); // Nave del jugador en la parte inferior de la pantalla
  naveEnemiga = new NaveEnemiga(width/2, 50, color(255, 0, 0)); // Nave enemiga en la parte superior de la pantalla
  disparosJugador = new ArrayList<Disparo>();
  disparosEnemigos = new ArrayList<Bomba>();
}

void draw() {
  background(0);
  image(fondo, 0, 0, 800, 600);
  // Movimiento y dibujo de la nave del jugador
  naveJugador.mover();
  naveJugador.mostrar();

  // Movimiento y dibujo de la nave enemiga
  naveEnemiga.mover();
  naveEnemiga.mostrar();

  // Movimiento y dibujo de los disparos del jugador
  for (int i = disparosJugador.size()-1; i >= 0; i--) {
    Disparo disparo = disparosJugador.get(i);
    disparo.mover();
    disparo.mostrar();

    // Verificar colisión con la nave enemiga
    if (naveEnemiga.colision(disparo)) {
      ganar = naveEnemiga.perderVida();
      disparosJugador.remove(i);
    }
  }
if(ganar){
  text("La nave invasora ha muerto, ganaste esta batalla", 350,350);
}
  // Movimiento y dibujo de los disparos de la nave enemiga
  for (int i = disparosEnemigos.size()-1; i >= 0; i--) {
    Bomba disparo = disparosEnemigos.get(i);
    disparo.mover();
    disparo.mostrar();

    // Verificar colisión con la nave del jugador
    if (naveJugador.colision(disparo)) {
      morir = naveJugador.perderVida();
      disparosEnemigos.remove(i);
    }
  }
  
  if(morir){
  text("Tu nave ha sido derrotada, perdiste esta batalla", 350,310);
}

  // Dibujar la barra de vida de la nave del jugador
  fill(0, 255, 0);
  rect(10, height - 20, naveJugador.vida, 10);

  // Dibujar la barra de vida de la nave enemiga
  fill(255);
  rectMode(CORNER);
  rect(10, 10, naveEnemiga.vida, 10);

  // Ataque de la nave enemiga
  if (frameCount % 60 == 0) { // La nave enemiga dispara cada segundo
    Bomba nuevoDisparoEnemigo = new Bomba(naveEnemiga.x, naveEnemiga.y, color(255, 255, 0));
    disparosEnemigos.add(nuevoDisparoEnemigo);
  }
}

void keyPressed() {
  if (key == ' ') {//barra espaciadora
    Disparo nuevoDisparo = new Disparo(naveJugador.x, naveJugador.y, color(0, 255, 0));
    disparosJugador.add(nuevoDisparo);
  }
}
