Personaje personaje;
Casa[] casas = new Casa[7];
Tramo[] camino = new Tramo[31];
PImage barrio;
int tramoActual = 0;
PImage[] personajes = new PImage[7];

void setup() {
  size(800, 600);
  for (int i=0; i<7; i++) {
    personajes[i] = loadImage("p" + (i + 1) + ".png");
  }
  crearCamino();
  crearCasas();
  barrio = loadImage("fondo.jpg");

  int x= camino[tramoActual].x;
  int y= camino[tramoActual].y;
  personaje =new Personaje( loadImage("chicaiz.png"), loadImage("chicader.png"), x, y);
}

void draw() {
  background(255);
  image(barrio, 0, 0, 800, 600);
  for (int i = 0; i< 7; i++) {
    casas[i].mostrar();
  }
  personaje.mostrarse();
  for (int i = 0; i< 7; i++) {
    if (casas[i].interior) {
      casas[i].mostrarTexto();
      break;
    }
  }
  //for (int i = 0; i< 31; i++) {
  //  camino[i].mostrar();
  //}
}
void mousePressed() {
  if (camino[tramoActual].hayCasa) {
    camino[tramoActual].ocultarInteriorCasa();
  }
}
void keyPressed() {
  boolean avanzando=true;
  if (camino[tramoActual].hayCasa) {
    camino[tramoActual].ocultarInteriorCasa();
  }

  if (key == 'a') {
    tramoActual--;
    avanzando=false;
  }
  if (key == 'd') {
    tramoActual++;
    avanzando=true;
  }
  if (key == ' ') {
    if (camino[tramoActual].hayCasa) {
      camino[tramoActual].mostrarCasa();
    }
  }

  if (tramoActual<0) {
    tramoActual = 0;
  } else if (tramoActual > 30) {
    tramoActual = 30;
  }

  int x = camino[tramoActual].x;
  int y = camino[tramoActual].y;
  personaje.mover(x, y, avanzando);
}

void crearCamino() {
  camino[0]=new Tramo(65, 0, 70, 70);
  camino[1]=new Tramo(65, 75, 70, 70);
  camino[2]=new Tramo(65, 150, 70, 70);
  camino[3]=new Tramo(65, 225, 70, 70);
  camino[4]=new Tramo(65, 300, 70, 70);
  camino[5]=new Tramo(65, 375, 70, 70);
  camino[6]=new Tramo(65, 450, 70, 70);

  camino[7]=new Tramo(130, 450, 70, 70);
  camino[8]=new Tramo(200, 450, 70, 70);

  camino[9]=new Tramo(270, 450, 70, 70);
  camino[10]=new Tramo(270, 375, 70, 70);
  camino[11]=new Tramo(270, 300, 70, 70);
  camino[12]=new Tramo(270, 225, 70, 70);
  camino[13]=new Tramo(270, 150, 70, 70);
  camino[14]=new Tramo(270, 75, 70, 70);

  camino[15]=new Tramo(340, 75, 65, 70);
  camino[16]=new Tramo(405, 75, 65, 70);
  camino[17]=new Tramo(470, 75, 65, 70);
  camino[18]=new Tramo(535, 75, 65, 70);
  camino[19]=new Tramo(600, 75, 65, 70);
  camino[20]=new Tramo(665, 75, 65, 70);

  camino[21]=new Tramo(665, 150, 70, 75);
  camino[22]=new Tramo(665, 230, 70, 70);
  camino[23]=new Tramo(665, 305, 70, 70);
  camino[24]=new Tramo(665, 380, 70, 75);
  camino[25]=new Tramo(665, 460, 70, 75);

  camino[26]=new Tramo(600, 460, 70, 75);
  camino[27]=new Tramo(535, 460, 70, 75);
  camino[28]=new Tramo(470, 460, 70, 75);

  camino[29]=new Tramo(470, 380, 70, 70);
  camino[30]=new Tramo(470, 305, 70, 70);
}

void crearCasas() {
  casas[0] = new Casa(133, 0, 130, 150, color(255, 0, 0));
  casas[0].setDueño(personajes[0], "Pronto!!! Debés encontrar la llave secreta!!!");
  camino[0].ponerCasa(casas[0]);
  camino[14].ponerCasa(casas[0]);
  camino[1].ponerCasa(casas[0]);

  casas[1] = new Casa(0, 530, 130, 100, color(0, 0, 255));
  camino[6].ponerCasa(casas[1]);
  casas[1].setDueño(personajes[1], "Hola, mi nombre es Sacha, por ahora no puedo ayudarte");

  casas[2] = new Casa(190, 300, 80, 80, color(0, 255, 0));
  camino[11].ponerCasa(casas[2]);
  casas[2].setDueño(personajes[2], "Tengo unas pistas pero se que  algunas podrian ser falsas");

  casas[3] = new Casa(610, 0, 130, 65, color(255, 255, 0));
  camino[19].ponerCasa(casas[3]);
  camino[20].ponerCasa(casas[3]);
  casas[3].setDueño(personajes[3], "Me gustaria ayudar pero tengo que resolver unos asuntos antes");

  casas[4] = new Casa(735, 150, 70, 150, color(255, 178, 0));
  camino[21].ponerCasa(casas[4]);
  camino[22].ponerCasa(casas[4]);
  casas[4].setDueño(personajes[4], "Que lindo dia para salir a buscar tesoros");

  casas[5] = new Casa(470, 540, 130, 100, color(178, 0, 255));
  camino[27].ponerCasa(casas[5]);
  camino[28].ponerCasa(casas[5]);
  casas[5].setDueño(personajes[5], "mmm, no puedo ayudarte porque ni se de que hablas");

  casas[6] = new Casa(400, 225, 135, 80, color(0, 255, 255));
  camino[30].ponerCasa(casas[6]);
  casas[6].setDueño(personajes[6], "Si tuviera la llave secreta no estaria en este lugar");
}
