class Pokemon {
  String nombre;
  String tipo;
  String[] poderes;
  String[] nombresPoderes;
  String[] descripcionesPoderes;
  int vida;
  int ataque;
  int defensa;
  int precision;
  int velocidad;
  String[] estados;
  String imagen;
  int posx;
  int posy;

  // Constructor
  Pokemon(String imagen, String nombre, String tipo, String[] poderes, String[] nombresPoderes, String[] descripcionesPoderes, int vida, int ataque, int defensa, int precision, int velocidad) {
    this.imagen = imagen;
    this.nombre = nombre;
    this.tipo = tipo;
    this.poderes = poderes;
    this.nombresPoderes = nombresPoderes;
    this.descripcionesPoderes = descripcionesPoderes;
    this.vida = vida;
    this.ataque = ataque;
    this.defensa = defensa;
    this.precision = precision;
    this.velocidad = velocidad;
  }

  String getNombre() {
    return nombre;
  }
  String getNombresPoderes(int index) {
    return nombresPoderes[index];
  }

  String getTipo() {
    return tipo;
  }
  int getPosx() {
    return posx;
  }
  int getPosy() {
    return posy;
  }
  int getVida() {
    return vida;
  }
  int getAtaque() {
    return ataque;
  }
  int getDefensa() {
    return defensa;
  }
  int getPrecision() {
    return precision;
  }
  int getVelocidad() {
    return velocidad;
  }
  String getImagen() {
    return imagen;
  }

  void setPosicion(int posx, int posy) {
    this.posx = posx;
    this.posy = posy;
  }
  void perderVida(int numero, String tipoEnemigo) {
    if (evaluarFortaleza(tipoEnemigo) == this.tipo) {
      vida = vida - (numero * 2);
      println("el ataque enemigo es muy efectivo");
    } else {
      if (evaluarDebilidad(tipoEnemigo) == this.tipo) {
        vida = vida - (numero / 2);
        println("el ataque enemigo NO es muy efectivo");
      } else {
        vida = vida - numero;
      }
    }
  }
  void ganarVida(int numero) {
    vida = vida + (vida*numero/10);
  }
  void perderDefensa(int numero) {
    defensa = defensa - (defensa * numero /10);
  }
  void ganarDefensa(int numero) {
    defensa = defensa + numero;
  }
  void perderPrecision(int numero) {
    precision = precision - (precision * numero /10);
  }
  void ganarVelocidad(int numero) {
    velocidad = velocidad + (velocidad * numero /10);
  }
  void perderVelocidad(int numero) {
    velocidad = velocidad - (velocidad * numero /10);
  }
  void ganarPrecision(int numero) {
    precision = precision + (precision * numero /10);
  }

  void usarPoderContra(Pokemon unPokemon, int unPoder) {
    String numero = poderes[unPoder];
    int vida = Integer.parseInt(numero.substring(0, 2));
    int ataque = Integer.parseInt(numero.substring(2, 4));
    int defensa = Integer.parseInt(numero.substring(4, 6));
    int precision = Integer.parseInt(numero.substring(6, 8));
    int velocidad = Integer.parseInt(numero.substring(8, 10));

    println("poder vida: " + vida + " ataque: " + ataque + " defensa: " + defensa + " precision: " + precision + " velocidad: " + velocidad);
    println("1  propia vida: " + this.vida + " ataque: " + this.ataque + " defensa: " + this.defensa + " precision: " + this.precision + " velocidad: " + this.velocidad);
    println("1 enemigo vida: " + unPokemon.getVida() + " ataque: " + unPokemon.getAtaque() + " defensa: " + unPokemon.getDefensa() + " precision: " + unPokemon.getPrecision() + " velocidad: " + unPokemon.getVelocidad());
    println(this.nombre + " ataca a: " + unPokemon.getNombre());
    if (vida == 0) {
    } else {
      if (vida >= 20) {
        unPokemon.perderVida(this.vida + (vida % 10), unPokemon.getTipo());
      } else {
        if (vida >= 10) {
          ganarVida(vida % 10);
        }
      }
    }
    if (ataque == 0) {
    } else {
      if (ataque >= 20) {
        unPokemon.perderVida(this.ataque + (this.ataque * (ataque % 10)), unPokemon.getTipo());
      } else {
        if (ataque >= 10) {
          ganarVida(this.ataque * (ataque % 10));
        }
      }
    }
    if (defensa == 0) {
    } else {
      if (defensa >= 20) {
        unPokemon.perderDefensa(defensa % 10);
      } else {
        if (defensa > 10) {
          ganarDefensa(this.defensa * (defensa % 10 /10));
        }
      }
    }
    if (precision == 0) {
    } else {
      if (precision >= 20) {
        unPokemon.perderPrecision(precision % 10);
      } else {
        if (precision >= 10) {
          ganarPrecision(precision % 10);
        }
      }
    }
    if (velocidad == 0) {
    } else {
      if (velocidad >= 20) {
        unPokemon.perderVelocidad(velocidad % 10);
      } else {
        if (velocidad >= 10) {
          ganarVelocidad(velocidad % 10);
        }
      }
    }

    println("2  propia vida: " + this.vida + " ataque: " + this.ataque + " defensa: " + this.defensa + " precision: " + this.precision + " velocidad: " + this.velocidad);
    println("2 enemigo vida: " + unPokemon.getVida() + " ataque: " + unPokemon.getAtaque() + " defensa: " + unPokemon.getDefensa() + " precision: " + unPokemon.getPrecision() + " velocidad: " + unPokemon.getVelocidad());
  }

  String evaluarDebilidad(String tipo) {
    switch (tipo) {
    case "agua":
      return "planta";
    case "fuego":
      return "agua";
    case "planta":
      return "fuego";
    case "tierra":
      return "agua";
    case "eléctrico":
      return "tierra";
    case "volador":
      return "eléctrico";
    case "bicho":
      return "fuego";
    case "normal":
      return "lucha";
    case "psíquico":
      return "siniestro";
    case "hada":
      return "veneno";
    case "fantasma":
      return "siniestro";
    case "acero":
      return "fuego";
    case "veneno":
      return "psíquico";
    case "hielo":
      return "fuego";
    case "roca":
      return "planta";
    case "lucha":
      return "psíquico";
    case "siniestro":
      return "hada";
    case "dragón":
      return "hada";
    default:
      return "No se encontró una relación";
    }
  }

  String evaluarFortaleza(String tipo) {
    switch (tipo) {
    case "agua":
      return "fuego";
    case "fuego":
      return "planta";
    case "planta":
      return "tierra";
    case "tierra":
      return "eléctrico";
    case "eléctrico":
      return "volador";
    case "volador":
      return "bicho";
    case "bicho":
      return "normal";
    case "normal":
      return "psíquico";
    case "psíquico":
      return "hada";
    case "hada":
      return "fantasma";
    case "fantasma":
      return "acero";
    case "acero":
      return "veneno";
    case "veneno":
      return "hielo";
    case "hielo":
      return "roca";
    case "roca":
      return "lucha";
    case "lucha":
      return "siniestro";
    case "siniestro":
      return "dragon";
    case "dragon":
      return "agua";
    default:
      return "No se encontró una relación";
    }
  }
}
