import processing.sound.*;

ArrayList<Nota> notas = new ArrayList<Nota>();
Timer temporizador;
PImage[] fotogramas = new PImage[6];
float i=0;
float velocidad = 0.1;
SoundFile[] musica = new SoundFile[3];
int contadorNotasBien = 0;
int contadorNotasMal = 0;
int cancionActual = 0;

void setup() {
  size(800, 600);
  temporizador = new Timer(1000);
  fotogramas[0]= loadImage("a2.jpg");
  fotogramas[1]= loadImage("a23.jpg");
  fotogramas[2]= loadImage("a3.jpg");
  fotogramas[3]= loadImage("a34.jpg");
  fotogramas[4]= loadImage("a4.jpg");
  fotogramas[5]= loadImage("a42.jpg");
  musica[0] = new SoundFile(this, "peacesells.mp3");
  musica[1] = new SoundFile(this, "tornado.mp3");
  musica[2] = new SoundFile(this, "judas.mp3");
}

void draw() {
  background(0);
  image(fotogramas[floor(i)], 0, 0);
  i=i+velocidad;
  if (i>5) {
    i=0;
  }
  fill(255);
  textSize(30);
  text("Precision: " + contadorNotasBien, 50, 50);
  text("Precision: " + contadorNotasMal, 50, 80);
  textSize(24);
  text("a", 240, 50);
  text("s", 340, 50);
  text("d", 420, 50);
  text("w", 500, 50);
  
  stroke(255);
  strokeWeight(5);
  line(280, 0, 100, 600);
  line(360, 0, 300, 600);
  line(440, 0, 500, 600);
  line(520, 0, 700, 600);

  line(0, 500, 800, 500);

  fill(200);
  ellipse(114, 550, 112, 56);
  ellipse(304, 550, 112, 56);
  ellipse(495, 550, 112, 56);
  ellipse(685, 550, 112, 56);

  if (temporizador.TiempoCumplido()) {
    int linea = int(random(0, 4));
    switch(linea) {
    case 0:
      notas.add(new Nota(280, 0, 100, 600, color(255, 128, 0), linea));
      break;
    case 1:
      notas.add(new Nota(360, 0, 300, 600, color(255, 255, 0), linea));
      break;
    case 2:
      notas.add(new Nota(440, 0, 500, 600, color(0, 255, 255), linea));
      break;
    case 3:
      notas.add(new Nota(520, 0, 700, 600, color(255, 0, 255), linea));
      break;
    }
  }

  for (int i = 0; i < notas.size(); i++) {
    Nota nota = notas.get(i);
    nota.mostrar();

    // Si la nota está fuera de la pantalla, eliminarla
    if (nota.destruir) {
      notas.remove(i);
      i--; // Disminuir el índice para evitar omitir notas
    }
  }
}

void ponerPlay() {
  if (musica[cancionActual].isPlaying()) {
    musica[cancionActual].pause();
    cancionActual++;
    if (cancionActual > 2){
     cancionActual = 0; 
    }
    musica[cancionActual].loop();
  } else {
    musica[cancionActual].loop();
  }
}

void keyPressed() {
  if (key == ' ') {
    ponerPlay();
  }

  if (key == 'a' || key == 's' || key == 'd' || key == 'w') {
    int linea = 0;
    switch(key) {
    case 'a':
      linea = 0;
      break;
    case 's':
      linea = 1;
      break;
    case 'd':
      linea = 2;
      break;
    case 'w':
      linea = 3;
      break;
    }

    // Iterar sobre todas las notas y verificar si alguna está en la línea y posición adecuadas
    for (Nota nota : notas) {
      if (nota.getPosY() > 500 && nota.linea == linea) {
        nota.colorNota = color(0, 255, 0);
        contadorNotasBien++;
      } else if (nota.getPosY() > 500 && nota.linea != linea){
        contadorNotasMal++;
      }
    }
  }
}
