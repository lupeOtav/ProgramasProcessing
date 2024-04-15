int x= 200;
int y= 200;
PImage foto;

void setup() {
  size(400, 400);
  foto = loadImage("fondo.jpg");
}

void draw() {
  background(20);
  image(foto, 0,0, 400, 400);
  
  fill(255,255,0,128);
  rect(300, 0,100,400);
  
  fill(255,128,0,128);
  rect(0, 300,400,100);
  
  fill(255);
  ellipse(x, y, 40,40);
  
}
//operadores decomparacion
//     &&   ||
void mousePressed(){
  if(mouseX > 200 && mouseX < 400)
    {
      //println('segundo cuadrante');
    }
}

void keyPressed(){
  //println(key);
  if(key == 'a' || key == 'A' || keyCode == LEFT){
     x=x-10;
  }
  if(key == 'd' || key == 'D' || keyCode == RIGHT){
     x=x+10;
     if(x>280){
        x=x-10;
      }
  }
  if(key == 'w' || key == 'W' || keyCode == UP){
     y=y-10;
  }
  if(key == 's' || key == 'S' || keyCode == DOWN){
     y=y+10;
     if(y>280){
       y=y-10;
      }
  }
}
