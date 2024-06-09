/*
EN ESTE EJEMPLO
 -Hacemos una clase Personaje.
 -Hacemos una clase pared.
 -Aprendemos sobre colisiones.
 */

Personaje miPersonaje;
//Pared unaPared;
Pared[] paredes = new Pared[6];

void setup() {
  size(800, 600);
  miPersonaje= new Personaje(loadImage("jengibre.png"), 100, 10, 80, 80);
  //Pared unaPared = new Pared(100, 100, 500, 60);
  paredes[0]=new Pared(100, 100, 500, 60);
  paredes[1]=new Pared(40, 0, 60, 160);
  paredes[2]=new Pared(100, 250, 600, 60);
  paredes[3]=new Pared(700, 0, 60, 500);
  paredes[4]=new Pared(0, 400, 500, 60);
  paredes[5]=new Pared(440, 460, 60, 210);
}

void draw() {
  background(255, 245, 240);
  miPersonaje.mostrar();
  for (int i=0; i<6; i++) {
    paredes[i].mostrarse();

    if (miPersonaje.chocaste(paredes[i])) {
      miPersonaje.cambiarAColisionado(0);
      println("chocaste");
    } else {
      miPersonaje.detenido=false;
    }
  }
}

void keyPressed() {
  // Mover el personaje según las teclas WASD
  if (key == 'W' || key == 'w' || keyCode == UP) {
    miPersonaje.mover(1);
  } else if (key == 'S' || key == 's' || keyCode == DOWN) {
    miPersonaje.mover(2);
  } else if (key == 'A' || key == 'a' || keyCode == LEFT) {
    miPersonaje.mover(3);
  } else if (key == 'D' || key == 'd' || keyCode == RIGHT) {
    miPersonaje.mover(4);
  }
}
