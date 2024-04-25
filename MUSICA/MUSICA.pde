import processing.sound.*;

//Ir a SKETCH, añadir biblioteca, gestionar bibliotecas y filtrar por sound y darle install
PImage fondo;
PImage fondo2;
SoundFile musica;
int i = 0;
int escena = 0;

void setup() {
  size(711, 400);
  fondo = loadImage("fondo.jpg");
  fondo2 = loadImage("fondo2.jpg");
  musica = new SoundFile(this, "trueno.mp3");
}

void draw() {
  switch (escena) {
  case 0:
    dibujarEscena0();
    break;
  case 1:
    dibujarEscena1();
    break;
  case 2:
    dibujarEscena2();
    break;
  }
}

void ponerPlay() {
  if (musica.isPlaying()) {
    musica.pause();
  } else {
    musica.loop();
  }
}

void mousePressed() {
  if (escena == 0 && mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 150) {
    escena = 1;
    ponerPlay() ;
  } else if (escena ==1 && mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 150) {
    escena = 0;
    ponerPlay() ;
  }
}

void dibujarEscena0() {
  image(fondo, 0, 0);
  stroke(0);
  strokeWeight(5);
  fill(255);
  rect(100, 100, 100, 50);
  fill(0);
  text("Play", 140, 130);
}

void dibujarEscena1() {
  image(fondo2, 0, 0);
  stroke(255);
  strokeWeight(5);
  fill(0);
  rect(100, 100, 100, 50);
  fill(255);
  text("Stop", 140, 130);
}

void dibujarEscena2() {
  // Aca dibuja la escena 2 si hubiera
}
