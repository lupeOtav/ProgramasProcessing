
void mostrarGrilla() {
  int x=0;
  for (int i = 20; i < 700; i=i+100) {
    for (int j = 20; j < 500; j=j+100) {
      if (x<36) {
        image( fondos[x], i, j, 90, 90);
        pokemones.get(x).setPosicion(i, j);
        x++;
      }
    }
  }
  x=0;
}

void MostrarPokemon(Pokemon unPokemon) {
  int offset = 40;
  image(fondos[i], 0, 0, 400, 400);
  fill(0, 128, 90);
  textSize(32);
  text("Nombre: " + unPokemon.nombre, 450, offset);
  fill(0);
  textSize(18);

  text("Tipo: " + unPokemon.tipo, 450, offset+30);
  text("Velocidad: " + unPokemon.velocidad, 450, offset +60);
  text("Ataque: " + unPokemon.ataque, 450, offset +90);
  text("Defensa: " + unPokemon.defensa, 450, offset + 120);
  text("Precision: " + unPokemon.precision, 450, offset + 150);
  text("Vida: " + unPokemon.vida, 450, offset + 180);

  MostrarPoderes(unPokemon);
}

void MostrarPoderes(Pokemon unPokemon) {
  int offset = 280;
  int x = 450;
  String[] poderes = unPokemon.poderes;
  textSize(24);
  fill(0, 128, 90);
  text("Poderes:", x, offset);
  fill(0);
  
  for (int j = 0; j < poderes.length; j++) {
    String nombrePoder = unPokemon.nombresPoderes[j];
    String descripcionPoder = unPokemon.descripcionesPoderes[j];
    textSize(18);
    text(nombrePoder, x, offset + 30); 
   
     textSize(12);
     text(descripcionPoder, x - 40, offset + 40, 420, 200);
    offset += 50;
  }
}
