float rojo = 255 ;
float verde = 128;
float azul =0;

void setup() {
  size(400, 400);
}

void draw() {
  background(azul,verde,rojo);
  fill(rojo,verde,azul);
  strokeWeight(10);
  stroke(0,255,0);
  rect(150,150,100,60);
  line(150, 0, 150,400);
  line(250, 0, 250,400);
  stroke(0,128,255);
  line(0,150, 400,150);
  line(0,210, 400, 210);
}

void mousePressed(){
  //operadores de comparacion
  // <,>,<=, >=, ==, !=
  //operadores logicos
  //&& || !
    
 /* if(mouseY>0 && mouseY<150){
   println("1er cuadrante");
  }
  if(mouseY>=150 && mouseY<210){
    println("2do cuadrante");
  }
  if(mouseY>=210 && mouseY<=400){
    println("3er cuadrante Y");
  }
  if(mouseX>=250 && mouseX<=400){
    println("3er cuadrante X");
  }*/
  if(mouseX>=150 && mouseX<250 && mouseY>=150 && mouseY<210){
    rojo = random(255);
    verde = random(255);
    azul = random(255);
  } 
  
}
