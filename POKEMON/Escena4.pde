void mostrarEquipo(int x, ArrayList<Pokemon> unEquipo) {
  int i = 0;
  for (int y = 100; y < 500; y = y + 170) {
    Pokemon unPokemon = unEquipo.get(i);
    PImage imagen = loadImage(unPokemon.getImagen());
    image(imagen, x, y, 150, 150);
    unPokemon.setPosicion(x, y);

    float vida = map(unPokemon.getVida(), 0, 300, 0, 150);
    fill(255);
    rect(x, y + 150, 150, 10);
    fill(0, 255, 0);
    rect(x, y + 150, vida, 10);

    // Dibujar el elipse del valor de ataque
    float ataque = map(unPokemon.getAtaque(), 0, 120, 0, 50);
    fill(255, 200, 0);
    ellipse(x+5, y+10, ataque, ataque); // Elipse en el borde superior izquierdo

    // Dibujar el rectángulo vertical de la velocidad
    float velocidad = map(unPokemon.getVelocidad(), 0, 120, 0, 150);
    fill(0, 80, 255);
    rect(x + 150, y, 10, velocidad); // Rectángulo vertical al lado derecho de la imagen

    i++;
  }
}

ArrayList generarEquipo()
{
  ArrayList<Pokemon> todos = pokemones;
  ArrayList<Pokemon> equipo = new ArrayList<Pokemon>();

  for (int j=0; j<3; j++) {
    float p = random(todos.size());
    Pokemon unPokemon= todos.get(int(p));
    equipo.add(unPokemon);
    todos.remove(unPokemon);
  }
  return equipo;
}
