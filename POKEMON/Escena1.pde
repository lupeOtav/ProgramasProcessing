void nextPokemon() {
  i++;
  if (i >= pokemones.size()) {
    i = 0;
  }
  pokemonSeleccionado = pokemones.get(i);
}

void aplicarPoder(char key){
 if (unPokemonEnemigo == null) {
      unPokemonEnemigo = pokemones.get(int(random(36)));
    }
    if (key == 'a' || key == 'A') {
      pokemonSeleccionado.usarPoderContra(unPokemonEnemigo, 0);
      println(pokemonSeleccionado.getNombre() + " usó el poder: " + pokemonSeleccionado.getNombresPoderes(0));
    } else if (key == 's' || key == 'S') {
      pokemonSeleccionado.usarPoderContra(unPokemonEnemigo, 1);
      println(pokemonSeleccionado.getNombre() + " usó el poder: " + pokemonSeleccionado.getNombresPoderes(1));
    } else if (key == 'd' || key == 'D') {
      pokemonSeleccionado.usarPoderContra(unPokemonEnemigo, 2);
      println(pokemonSeleccionado.getNombre() + " usó el poder: " + pokemonSeleccionado.getNombresPoderes(2));
    } else if (key == 'w' || key == 'W') {
      pokemonSeleccionado.usarPoderContra(unPokemonEnemigo, 3);
      println(pokemonSeleccionado.getNombre() + " usó el poder: " + pokemonSeleccionado.getNombresPoderes(3));
    } 
}
