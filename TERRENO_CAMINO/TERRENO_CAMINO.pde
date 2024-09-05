Baldosa[] terreno = new Baldosa[64];
PImage[] texturas = new PImage[7];
Personaje personaje;
Npc[] npcs = new Npc[23];
boolean[] npcsEnTablero = new boolean[23];

void setup() {
  size(640, 640);
  personaje = new Personaje(loadImage("chicader.png"), loadImage("chicaiz.png"), 0, 0, 60, 80);
  crearNpcs();
  crearTerreno();
}

void draw() {
  for (int i=0; i<64; i++) {
    terreno[i].mostrar();
  }
  for (int a=0; a<23; a++) {
    if (npcsEnTablero[a]) {
      npcs[a].mostrarse();
    }
  }
  personaje.mostrarse();
}

void keyPressed() {
  if (key == 'w') {
    if (chequearMovimientoPosible(personaje.x, personaje.y - 80)) {
      personaje.mover(1);
    }
  }
  if (key == 's') {
    if (chequearMovimientoPosible(personaje.x, personaje.y + 80)) {
      personaje.mover(2);
    }
  }
  if (key == 'a') {
    if (chequearMovimientoPosible(personaje.x - 80, personaje.y)) {
      personaje.mover(3);
    }
  }
  if (key == 'd') {
    if (chequearMovimientoPosible(personaje.x + 80, personaje.y)) {
      personaje.mover(4);
    }
  }
}

boolean chequearMovimientoPosible(int x, int y) {
  for (int i=0; i< terreno.length; i++) {
    if (x == terreno[i].x && y == terreno[i].y) {
      return terreno[i].sePuedeOcupar();
    }
  }
  return true;//cuando se sale de la pantalla entra aca
}

void crearNpcs() {
  for (int a=0; a<23; a++) {
    npcs[a] = new Npc(loadImage("p" + (a+1) + ".png"), 60, 80);
  }
  npcs[0].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[1].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[2].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[3].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[4].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[5].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[6].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[7].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[8].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[9].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[10].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[11].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[12].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[13].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[14].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[15].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[16].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[17].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[18].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[19].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[20].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[21].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
  npcs[22].setDialogos(new String[]{"", "", "", "", "", "Ya no diré mas"});
}

void crearTerreno() {
  for (int t=0; t<7; t++) {
    texturas[t] = loadImage("c" + t + ".jpg");
  }
  
  int i=0;
  for (int x = 0; x < width; x += 80) {
    for (int y = 0; y < height; y += 80) {
      int opcion = floor(random(7));
      if (opcion == 3) {
        int pos = floor(random(23));
        npcsEnTablero[pos] = true;
        npcs[pos].setPosicion(x, y);
      }
      terreno[i] = new Baldosa(x, y, 80, 80, texturas[opcion], opcion);
      i++;
    }
  }
}
