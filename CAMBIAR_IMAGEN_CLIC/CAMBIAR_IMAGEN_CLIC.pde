PImage[] imagenes;
String[] textos;
int i = 0;
int j = 0;
int cantidadImagenes = 3;
int cantidadTextos = 15;
int momento = 0;

void setup() {
  size(400, 600);
textos = new String[] {
    "(Con voz resignada) Buenos días a todos.\n Mi nombre es Ana",
    "Sí, esa soy yo, la que pastaba en el corral,\n masticaba pasto y producía leche.",
    "Pero hoy, quiero decirles que no quiero\n ser parte de un asado.",
    "¡No quiero ser un trozo de \n carne en una parrilla!",

    "(Indignada) ¡Es que acaso nadie más ve \n lo que está pasando acá! ",
    "Todos los días nos miran  \n  con ojos de hambre. ¡Es inhumano! \n  (Pausa dramática)",
    "(Frustrada) He intentado hablar con las gallinas \ny los cerdos, pero ellos parecen conformes \n con su destino.",
    "Yo no lo soy. \n No quiero conformarme.",

    "(Con desánimo) A veces me pregunto si \n hay esperanza.",
    "¿Podré alguna vez \n escapar de esta cruel realidad? ¿O\nestoy destinada a terminar en una bandeja?  \n (Sus ojos se llenan de lágrimas)",
    "(Decidida) Aunque sienta miedo, no me rendiré.\n Lucharé por vivir una vida plena. "
    ,"¿Por qué no podemos ser libres y \n felices aunque estemos en un corral? \n  No estamos acá para ser comida  \n ¡Merecemos vivir!",

    "Lucharé por mí y por todos en esta granja.\n Haré lo que sea necesario para \n cambiar nuestro destino. Aunque no\nsepamos cómo, tenemos que intentarlo.",
    "(Terminando con determinación) \n Así que, amigos y amigas,  \n les pido que se unan a mi causa.",
    "Queremos una vida plena y justa.\n ¡Entre todos podemos hacerlo!",
    "Aunque la luz esté atenuandose\n espero dejar un mensaje de esperanza y resistencia.\n Muchas gracias",
};

  
  imagenes = new PImage[] {
    loadImage("i1.jpg"),
    loadImage("i2.jpg"),
    loadImage("i3.jpg"),
    loadImage("i4.jpg"),
  };
}

void draw() {
  background(200);
  switch (momento) {
    case 0:
      fill(0);
      rect(10, 10, 380, 570);
      textSize(16);
      fill(255);
      text("Comenzar", 165, 500);
      break;
    case 1:
      image(imagenes[i], 10, 10, 380, 570);
      fill(255);
      rect(20, 470, 360, 100);
      textSize(16);
      fill(0);
      text(textos[j], 30, 500, 350);
      break;
    case 2:
      fill(0);
      rect(10, 10, 380, 570);
      textSize(16);
      fill(255);
      text("Reiniciar", 165, 500);
      break;
  }
}

void mousePressed() {
  switch (momento) {
    case 0:
      momento = 1;
      break;
    case 1:
      j++;
      if (j % 4 == 0) {
        i++;
      }
      if (i > cantidadImagenes) {
        i = 0;
      }
      if (j > cantidadTextos) {
        j = 0;
        momento = 2;
      }
      break;
    case 2:
      momento = 1;
      break;
  }
}
