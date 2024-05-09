Personaje personaje;
Enemigo enemigo;
Pared pared1;
Pared pared2;

void setup() {
  size(400, 400);
  personaje = new Personaje(width/2, height/2);
  enemigo = new Enemigo(300, 300);
  pared1 = new Pared(100, 90, 10, 180);
  pared2 = new Pared(80, 40, 100, 10);
}

void draw() {
  background(255);
  personaje.mostrar();
  enemigo.mostrar();

  pared1.mostrar();
  pared2.mostrar();
  personaje.actualizarPosicion();
  if (personaje.colision(enemigo)) {
    println("te moriste");
    personaje.cambiarColorColisionado(1);
  }
    if (personaje.colisionPared(pared1)) {
    println("chocaste 1");
     personaje.cambiarColorColisionado(0);
  }
      if (personaje.colisionPared(pared2)) {
    println("chocaste 2");
     personaje.cambiarColorColisionado(0);
  }
}

void keyPressed() {
  // Mover el personaje según las teclas WASD
  if (key == 'W' || key == 'w' || keyCode == UP) {
    personaje.mover('W');
  } else if (key == 'S' || key == 's' || keyCode == DOWN) {
    personaje.mover('S');
  } else if (key == 'A' || key == 'a' || keyCode == LEFT) {
    personaje.mover('A');
  } else if (key == 'D' || key == 'd' || keyCode == RIGHT) {
    personaje.mover('D');
  }
}
