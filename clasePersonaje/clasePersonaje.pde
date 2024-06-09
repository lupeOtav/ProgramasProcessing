Enemigo estrella3;
Enemigo estrella2;
Enemigo estrella;
Personaje personaje;
Pocima pocima;

void setup() {
  size(600, 600);
  estrella = new Enemigo(loadImage("estrella.png"), 400, 1);
  estrella2 = new Enemigo(loadImage("estrella.png"), 500, 0);
  estrella3 = new Enemigo(loadImage("estrella.png"), 100, 10);
  pocima = new Pocima(loadImage("corazon.png"), 500, 20);
  personaje =new Personaje( loadImage("jengibre.png"), loadImage("jengibre2.png"), 100, 200);
}

void draw() {
  background(255);

  personaje.mostrarse();
  estrella.mostrarse();
  estrella2.mostrarse();
  estrella3.mostrarse();
  pocima.mostrarse();
  if (personaje.chocaste(estrella) || personaje.chocaste(estrella2) || personaje.chocaste(estrella3)) {
    personaje.envenenado();
  } else {
    personaje.curado();
  }
  if (personaje.encontrastePocima(pocima)) {
    personaje.tomarPocima(pocima);
  }
}

void keyPressed() {
  if (key == 'w') {
    personaje.mover(1);
  }
  if (key == 's') {
    personaje.mover(2);
  }
  if (key == 'a') {
    personaje.mover(3);
  }
  if (key == 'd') {
    personaje.mover(4);
  }
}
