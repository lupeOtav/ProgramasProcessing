PImage objetoBueno;
PImage objetoMalo;
Objeto[] objetos= new Objeto[144];
int obj=0;
int xOB=0;
int yOB=0;
int xOM=50;
int yOM=50;
int tiempoAnterior=0;
int intervalo=10000;
boolean primeraVez=true;
boolean ganaste=false;
boolean reiniciarVisible=false;
float tamaño=50;

void setup() {
  size(600, 600);
  reiniciar();
}

void draw() {
  background(200);
  image(objetoBueno, xOB, yOB, tamaño, tamaño);
  image(objetoMalo, xOM, yOM, 50, 50);

  if (millis()-tiempoAnterior > intervalo) {
    if (!ganaste) {
      fill(255, 0, 255);
      textSize(32);
      text("Te quedaste sin tiempo", 50, 50);
      reiniciarVisible = true;
    } else {
      reiniciarVisible = true;
    }
  } else {
    if (!ganaste) {
      for (int i=0; i<144; i++) {
        objetos[i].mostrar();
      }
      if (primeraVez) {
        fill(255, 128, 0);
        textSize(24);
        text("Tenes 10 segundos para encontrar la piedra oculta, hace click sobre el negro para encontrarla", 50, 100, 500, 500);
      }
    } else {
      tamaño = 60*floor(cos(millis() *0.01));
      fill(0, 0, 0);
      textSize(32);
      text("Encontraste la piedra oculta, Felicitaciones", 50, 50, 500, 500);
      reiniciarVisible = true;
    }
  }
  if (reiniciarVisible) {
    fill(255);
    rect(500, 0, 100, 40);
    fill(0);
    textSize(18);
    text("Reiniciar", 520, 25);
  }
}

void mousePressed() {
  if (reiniciarVisible) {
    if (mouseX>500 && mouseY < 40) {
      reiniciar();
      reiniciarVisible=false;
    }
  } else
    primeraVez=false;
  for (int i=0; i<144; i++) {
    if (objetos[i].clikeado()) {
      objetos[i].setVisible(false);
      if (mouseX>xOB && mouseX<xOB +50 && mouseY>yOB && mouseY<yOB +50) {
        ganaste = true;
      }
    }
  }
}

void reiniciar() {
  obj=0;
  xOB=0;
  yOB=0;
  xOM=50;
  yOM=50;
  tiempoAnterior=0;
  primeraVez=true;
  ganaste=false;
  tamaño=50;


  xOB=(int) random(0, 12) * 50;
  yOB=(int) random(0, 12) * 50;
  xOM=(int) random(0, 12) * 50;
  yOM=(int) random(0, 12) * 50;
  objetoBueno=loadImage("B3.png");
  objetoMalo=loadImage("B1.png");

  for (int i = 0; i<600; i = i+50) {
    for (int j = 0; j<600; j = j+50) {
      objetos[obj] = new Objeto(i, j);
      obj++;
    }
  }
  tiempoAnterior=millis();
}
