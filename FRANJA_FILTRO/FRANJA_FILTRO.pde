Personaje sprite1;
Personaje sprite2;
Personaje sprite3;
PImage casa;

void setup() {
  size(800, 500);
  casa=loadImage("casa.jpg");
  sprite1 =new Personaje( "p5.png", 100, 220);
  sprite2 =new Personaje( "p6.png", 300, 220);
  sprite3 =new Personaje( "p7.png", 500, 220);
}

void draw() {
  background(255);
  image(casa,0,0,800,500);
  sprite1.updateSection();  // Actualiza la sección del sprite
  sprite2.updateSection();
  sprite3.updateSection();
  sprite1.mostrar();
  sprite2.mostrar();
  sprite3.mostrar();
}
