void inicializar(){
   JSONObject data = loadJSONObject("pokemon2.json");
  JSONArray datosPokemon = data.getJSONArray("Pokemon");
  pokemones = cargarPokemonDesdeJSON(datosPokemon);
  fondos = new PImage[datosPokemon.size()];
  estadio=loadImage("estadio.jpg");
  for (int i = 0; i < datosPokemon.size(); i=i+1) {
    fondos[i] = loadImage(datosPokemon.getJSONObject(i).getString("Imagen"));
  } 
}

ArrayList<Pokemon> cargarPokemonDesdeJSON(JSONArray pokemones) {
  ArrayList<Pokemon> pokemonesLista;
  pokemonesLista = new ArrayList<Pokemon>();

  for (int i = 0; i < pokemones.size(); i++) {
    JSONObject pokemonData = pokemones.getJSONObject(i);
    String nombre = pokemonData.getString("Nombre");
    String imagen = pokemonData.getString("Imagen");
    String tipo = pokemonData.getString("Tipo");
    JSONArray poderesArray = pokemonData.getJSONArray("Poderes");
    String[] poderes = new String[4];
   
    JSONObject poderData = poderesArray.getJSONObject(0);
    poderes[0] = poderData.getString("p1");
    poderes[1] = poderData.getString("p2");
    poderes[2] = poderData.getString("p3");
    poderes[3] = poderData.getString("p4");
    
    JSONArray descripciones = pokemonData.getJSONArray("DescribePoder");
    String[] poderesNombres = new String[descripciones.size()];
    String[] poderesDescripciones = new String[descripciones.size()];
    for (int j = 0; j < descripciones.size(); j++) {
      JSONObject poderDescData = descripciones.getJSONObject(j);
      poderesNombres[j] = poderDescData.getString("Nombre");
      poderesDescripciones[j] = poderDescData.getString("Descripcion");
    }

    int vida = pokemonData.getInt("Vida");
    int ataque = pokemonData.getInt("Ataque");
    int defensa = pokemonData.getInt("Defensa");
    int precision = pokemonData.getInt("Precisión");
    int velocidad = pokemonData.getInt("Velocidad");

    pokemonesLista.add(new Pokemon(imagen, nombre, tipo, poderes, poderesNombres, poderesDescripciones, vida, ataque, defensa, precision, velocidad));
  }

  return pokemonesLista;
}
