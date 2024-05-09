PImage estadio;
int i = 0;
PImage[] fondos;
int escena = 2; //por ahora solo va en 2 o 3, a los demas numeros pasa automaticamente
int[] equipo = new int[6];
ArrayList<Pokemon> pokemones = new ArrayList<Pokemon>();
Pokemon pokemonSeleccionado;
Pokemon unPokemonEnemigo;
ArrayList<Pokemon> equipo1;
ArrayList<Pokemon> equipo2;
boolean mostrarSeleccion = false;

void setup() {
  size(850, 650);
  inicializar();
}

void draw() {
  background(200);

  switch(escena) {
  case 1:
    MostrarPokemon(pokemonSeleccionado);
    line(0, 500, 800, 500);
    textSize(32);
    text("Volver", 520, 550);
    break;
  case 2:
    mostrarGrilla();
    break;
  case 3:
    image(estadio, 0, 0, 850, 650);
    equipo1 = generarEquipo();
    equipo2 = generarEquipo();
    escena = 4;
    break;
  case 4:
  image(estadio, 0, 0, 850, 650);
    fill(255, 0, 0);
    strokeWeight(3);
    if (!mostrarSeleccion) {
      rect(95, 95, 160, 160);
    } else {
      rect(pokemonSeleccionado.getPosx()-5, pokemonSeleccionado.getPosy()-5, 160, 160);
    }
    mostrarEquipo(100, equipo1);
    mostrarEquipo(600, equipo2);
    
    fill(0);
    textSize(32);
    text("En esta escena deberian pelear pero esta en construccion", 290,280, 300,400);
    break;
  }
}

void keyPressed() {
  if (escena == 1) {
    aplicarPoder(key);
  }
}
void mousePressed() {
  switch(escena) {
  case 1:// si muestra el pokemon seleccionado
    if (mouseY > 500) {
      escena = 2;
    } else {
      unPokemonEnemigo = pokemones.get(int(random(36)));
      nextPokemon();
    }
    break;
  case 2:// si muestra la grilla de pokemon
    escena = 1;
    pokemonSeleccionado = buscarPokemon(pokemones, mouseX, mouseY, 90);
    break;
  case 3:
    break;
  case 4:
    mostrarSeleccion = true;
    pokemonSeleccionado = buscarPokemon(equipo1, mouseX, mouseY, 150);
    break;
  }
}

Pokemon buscarPokemon(ArrayList<Pokemon> pokemones, int x, int y, int anchoImagen) {
  int c = 0;
  for (Pokemon unPokemon : pokemones) {
    int posX = unPokemon.getPosx();
    int posY = unPokemon.getPosy();
    int altoImagen = anchoImagen;

    if (x >= posX && x <= posX + anchoImagen && y >= posY && y <= posY + altoImagen) {
      i=c;
      return unPokemon; // Devolver el Pokemon si se encontró
    }
    c++;
  }
  return pokemonSeleccionado; // Devolver null si no se encontró ningún Pokemon en el área del clic
}
