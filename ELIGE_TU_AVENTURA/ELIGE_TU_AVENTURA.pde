int escenaActual=0;
boolean inicio=true;
PFont miFuente;
PImage castillo;
PImage escalera;
PImage hab1;
PImage hab2;
PImage hab3;
PImage hab4;
PImage hab5;

String[]   textos={"Eres un valiente aventurero que \n ha llegado  a un antiguo castillo abandonado \n en busca de un tesoro legendario. \n Al entrar en el castillo, \n te encuentras con dos puertas frente a ti. \n¿Cuál eliges?",
         "Te adentras en la habitación oscura \n y encuentras un cofre dorado en el centro. \n¿Lo abres o decides explorar más el castillo?",
         "La puerta se abre y entras en \n una sala llena de estatuas cubiertas de polvo.\n Al acercarte a una de las estatuas, \n escuchas un ruido detrás de ti. \n ¿Te das la vuelta para investigar o sigues explorando?",
         "Al abrir el cofre, te das cuenta \n de que está lleno de monedas de oro \n y joyas brillantes. ¡Has encontrado el tesoro! \n Pero de repente, escuchas un ruido sospechoso detrás de ti.\n ¿Te escondes o te enfrentas a lo desconocido?",
          "Continúas explorando el castillo y \n descubres una escalera que lleva a un \n sótano oscuro. ¿Bajas por las escaleras o \n decides regresar a la entrada \n principal del castillo?",
          "Te das la vuelta y te encuentras \n con una sombra misteriosa. ¡Es un ladrón que también \n buscaba el tesoro! Te exige que le entregues \n tus pertenencias o de lo contrario...\n ¿Qué decides hacer?",
          "Sigues explorando el castillo y \n llegas a una sala secreta. En el suelo,\n encuentras un mapa antiguo que parece llevar \n a un tesoro escondido en el jardín del castillo.\n ¿Sigues el mapa o decides buscar en \n otra parte del castillo?",
          "Te escondes rápidamente detrás de un \n mueble cercano mientras el ruido se acerca.\n La puerta se abre y un guardián del tesoro entra\n  en la habitación. Permaneces en silencio y \nobservas sus movimientos cuidadosamente.\n Después de un rato, el guardián se va y tú sales \n de tu escondite ileso. Continúas explorando \n el castillo en busca del tesoro.",
          "Decides enfrentarte a lo desconocido \n y te giras para confrontar al ruido. Para tu sorpresa,\n te encuentras con un grupo de murciélagos que salen \n volando rápidamente. Te das cuenta de que debes \n estar cerca de un área de anidación de murciélagos.\n Aunque te asustas un poco, continúas \n tu búsqueda del tesoro en el castillo.",
          "Bajas por las escaleras hacia el \n sótano oscuro. A medida que avanzas,\n escuchas el sonido de gotas de agua cayendo.\n Enciendes tu linterna y la luz revela un \n pasaje secreto. Decides seguir el pasaje y \n descubres una habitación llena de reliquias. \n Estás emocionado porque sabes que estás \n cerca de encontrar el tesoro.",
          "Decides regresar a la entrada principal \n del castillo y explorar más áreas. Mientras \n caminas por los pasillos, encuentras una puerta entrecerrada.\n La abres y te encuentras con una sala lujosamente decorada.\n En el centro de la habitación, hay una mesa con un antiguo mapa desplegado. \n El mapa muestra la ubicación exacta del tesoro que has estado buscando. \nSientes que estás un paso más cerca de tu objetivo.",
          "Decides entregarle tus pertenencias al ladrón.\n Él toma tus cosas y huye rápidamente.\n  Te quedas un momento sorprendido, pero luego \n te das cuenta de que la vida y tu búsqueda del tesoro continúan.\n Sigues adelante con determinación y esperanza.",
          "Decides enfrentarte al ladrón valientemente.\n Tienes una breve lucha, pero finalmente logras someterlo.\n Llamas a las autoridades y el ladrón es arrestado.\n Te felicitan por tu valentía y te agradecen por ayudar \n a atrapar a un delincuente peligroso.\n Sigues tu búsqueda del tesoro con un nuevo sentido de confianza y determinación.",
          "Decides seguir el mapa que encontraste \n en la sala secreta. El mapa te lleva \n al jardín del castillo, \n donde encuentras un antiguo árbol \n con una marca distintiva. \n Excavas en el lugar indicado y, \n para tu sorpresa, descubres un cofre enterrado.\n Abres el cofre y encuentras el tesoro que \n has estado buscando durante tanto tiempo. \n Te sientes lleno de alegría y satisfacción por tu éxito.",
          "Decides abandonar la búsqueda \n  del tesoro y salir del castillo. \n Aunque no encontraste el tesoro esta vez, \n aprendiste mucho y viviste emocionantes aventuras. \n Sales del castillo con nuevas historias para contar \n y con la esperanza de que algún día puedas \n embarcarte en otra emocionante búsqueda."
  };
String[]  opciones={
    "Si eliges \n la puerta izquierda",
    "Si eliges \n la puerta derecha",
    "Si decides \n abrir el cofre",
    "Si decides \n explorar más",
    "Si te das \n la vuelta",
    "Si sigues \n explorando",
    "Si te escondes",
    "Si te enfrentas",
    "Si bajas por \n las escaleras",
    "Si regresas a \n la entrada principal",
    "Si decides \n entregarle tus \n pertenencias",
    "Si decides \n enfrentarte al ladrón",
    "Si decides \n seguir el mapa",
    "Si decides buscar en \n otra \n parte del castillo",
    "Continuará"
  };


void preload(){
  castillo=loadImage("castillo.jpg");
  escalera=loadImage("escalera.jpg");
  hab1=loadImage("habitacion1.jpg");
  hab2=loadImage("habitacion2.jpg");
  hab3=loadImage("hab3.jpg");
  hab4=loadImage("hab4.jpg");
  hab5=loadImage("hab5.jpg");
}

void setup() {
  size(600, 400);
  preload();
  miFuente = createFont("Poppins.ttf",24);
  textAlign(LEFT);
}

void draw() {
  textFont(miFuente);
  fill(0);
  background(220);
  
  switch(escenaActual){
    case 0:
      image(castillo,0,0);
      escena0();
      break;
    case 1:
      image(hab1,0,-400);
      dibujarEscena(0,0,1);
      break;
    case 2:
      image(hab1,0,0);
      dibujarEscena(1,2,3);
      break;
    case 3:
      image(hab2,0,0);
      dibujarEscena(2,4,5);
      break;
    case 4:
      image(hab3,0,0);
      dibujarEscena(3,6,7);
      break;
    case 5:
       image(escalera,0,-100);
      dibujarEscena(4,8,9);
      break;
    case 6:
       image(hab4,0,0);
      dibujarEscena(5,10,11);
      break;
    case 7:
       image(hab5,0,0);
      dibujarEscena(6,12,13);
      break;
    case 8:
       image(hab5,0,-400);
      dibujarEscena(7, 14,14);
      break;
    case 9:
      image(hab4,0,-400);
      dibujarEscena(8, 14,14);
      break;
    case 10:
      image(hab3,0,-400);
      dibujarEscena(9, 14,14);
      break;
    default:
      image(hab1,0,-400);
      fill(255);
      text("La historia continuara algun dia, \n pero por ahora solo se puede \n volver al inicio",60,220,500);
  }
  if(!inicio){
      fill(255);
      rect(450,20,140,30);
      fill(0);
      textSize(18);
      text("Volver al inicio",455, 40);
  }
}

void escena0(){
  fill(255);
  textSize(34);
  text("El Misterio \ndel Viejo Castillo",110, 60);
  rect(150,320,140,60);
  textSize(18);
   fill(0);
  text("Comenzar",170,360);
}

void dibujarEscena(int texto, int opcion1, int opcion2){
  stroke(255);
  strokeWeight(3);
  textSize(24);
  fill(255);
  text(textos[texto],10, 80,550);
  rect(20,320,200,60);
  rect(300,320,200,60);
  textSize(18);
  fill(0);
  text(opciones[opcion1],30,340);
  text(opciones[opcion2],310,340,200);
}


void mousePressed(){
  if(mouseX>150 && mouseX<290 && mouseY>320 && mouseY<380 && inicio){
    escenaActual=1;
    inicio=false;
  }else{
    if(!inicio && mouseX>450 && mouseX<590 && mouseY>20 && mouseY<60){
      escenaActual=0;
      inicio=true;
    }

  if(mouseX>20 && mouseX<220 && mouseY>320 && mouseY<380){
    switch(escenaActual){
           case 1:
             escenaActual=2;
           break;
           case 2:
             escenaActual=4;
           break;
           case 3:
             escenaActual=6;
           break;
           case 4:
             escenaActual=8;
           break;
          case 5:
             escenaActual=10;
           break;
          case 6:
             escenaActual=12;
           break;
          case 7:
             escenaActual=14;
           break;
          case 8:
             escenaActual=16;
           break;
          case 9:
             escenaActual=18;
           break;
          case 10:
             escenaActual=20;
           break;
           }
  }
  if(mouseX>300 && mouseX<500 && mouseY>320 && mouseY<380){
         switch(escenaActual){
           case 1:
             escenaActual=3;
           break;
          case 2:
             escenaActual=5;
           break;
          case 3:
             escenaActual=7;
           break;
          case 4:
             escenaActual=9;
           break;
          case 5:
             escenaActual=11;
           break;
          case 6:
             escenaActual=13;
           break;
          case 7:
             escenaActual=15;
           break;
          case 8:
             escenaActual=17;
           break;
          case 9:
             escenaActual=19;
           break;
          case 10:
             escenaActual=21;
           break;

           }
     }
      }
}
