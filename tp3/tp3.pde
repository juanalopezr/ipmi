// Juana Lopez Rosa comision 2
//presionar r para reiniciar
// link a video : https://youtu.be/SeaZBjTjYS8

PImage foto;

float tami= tamano (4.8,100);  //valor q uso para espaciar los circ

boolean ninja= true;
color blanco,negro;

void setup(){
  size(800,400);
 
  negro = color(0);
  blanco = color(255);
  
  foto = loadImage ("artop.jpg");
  
  mouseX=600;
  mouseY=200;
}

void draw(){
  background (negro);
  
  image (foto,0,0,400,400);
  
  optico(0,250,20);
  if (!ninja)
  botones (255,0,200,350,10,100,40);
}

//FUNCIONES 

void optico(float zero, float max, float veinte){
  
  for (int i = 20; i <38; i++) {
    for (int j = 0; j <21; j++) {
      
      fill (blanco);
      float distan =dist (mouseX, mouseY, i*tami, j*tami);
      float diagonal =dist (zero, zero, max, zero);
      float rango =map (distan, zero, diagonal, zero, veinte);
      
      ellipse (i*tami, j*tami, rango, rango); // calculo en q posicion se coloca cd circulo 
    }
  }
}

//NO RETORNA VALOR

void botones (int max, int zero, int otro, int x, int y, int ancho, int largo) {
  //los colores de cada bot van a depender de los parámetros
  //BOTON B
  
  fill (max, otro, zero);
  rect (x, x, ancho, largo);
  
  //BOTON A 
  
  fill (zero, max, otro);
  rect (x, y, ancho, largo);
}


void mousePressed (){
  //click en botones para cambio de color
  if (mouseX>= 350 && mouseX < 350+100 && mouseY >350 && mouseY< 350+40){
    blanco= color(255, 200, 0);
  }else if (mouseX>=350 && mouseX <350+100 && mouseY>10 && mouseY< 10+40){
    blanco= color (0, 255, 200);
  }else if (ninja== true) ninja = false;  //con ninja alterno entre false-true para mostrar o no los botones
  else ninja = true;
}

void keyPressed (){  //reincio programa presionando r
  if (key == 'r') {
    mouseX = 600;
    mouseY = 200;
    blanco = (255);
  }
}


//RETORNA VALOR

float tamano (float cant, float cin){
  float total = cin/cant;
  
  return total;
}
    
