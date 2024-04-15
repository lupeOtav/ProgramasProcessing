PImage fondo;
PImage casco1;
PImage casco2;
PImage avatar1;
PImage avatar2;
int xc1=30;
int yc1=35;
int xc2=210;
int yc2=30;
int opcion=1;

void setup() {
  size(700, 400);
  casco1= loadImage("masc1.png");  
  casco2= loadImage("masc3.png"); 
  avatar1= loadImage("mujer1.png");  
 avatar2= loadImage("homb2.png"); 
  //fondo= loadImage("cajas.jpg"); 
}

void draw() {
  background(220);
  fill(255, 220, 210);
  line(400, 0, 400, 400);
  rect(400, 300, 300, 100);
  image(avatar1,490,100, 180,200);
 // image(fondo,0,0,400,400);
  image(casco1,xc1,yc1, 160,160);
  image(casco2,xc2,yc2, 160,160);

}

void mouseDragged(){
  switch(opcion){
      case 1:
         xc1= mouseX;
         yc1= mouseY;
         break;
      case 2:
         xc2= mouseX;
         yc2= mouseY;
         break;
    }
}

void mousePressed(){
  if(mouseX>xc1 && mouseX <= xc1 + 160 && mouseY>yc1 && mouseY<=yc1 +160){
       opcion=1; 
  }

  if(mouseX>xc2 && mouseX <= xc2 + 160 && mouseY>yc2 && mouseY<=yc2 + 160)   {
        opcion =2;
  }

}
