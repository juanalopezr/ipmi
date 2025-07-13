   // Juana Lopez Rosa comision 2 tp3rec
//presionar r para reiniciar
// link a video: https://youtu.be/GMQ7PihRLQA
// pd perdon si me trabo en el video, lo grabe mil veces y es el que mejor quedo


//RETORNA VALOR
float tamano (float cant, float cin){
  float total = cin/cant;
  return total;
}

PImage foto;

float tami= tamano(4.8,100);  //valor q uso para espaciar los circulos q dibujo en la griilla que dibujo en la funcion optico
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
  
  if (!ninja) {
  boton (0, 255, 200, 350, 10, 100, 40); //b verde
  boton (255, 200, 0, 350, 350, 100, 40); //b amarillo
}
}

//funcion botones

void boton (int r, int g, int b, int x, int y, int ancho, int alto) {
  fill (r,g,b);
  rect (x, y, ancho, alto);
  
}
    
//grilla para los circulos
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

void mousePressed (){
  //click en botones para cambio de color
  if (mouseX >= 350 && mouseX < 450 && mouseY > 10 && mouseY < 50) {
    blanco = color(0, 255, 200); // Color 1
  } else if (mouseX >= 350 && mouseX < 450 && mouseY >= 350 && mouseY < 390) {
    blanco = color(255, 200, 0); // Color 2
  } else {
    ninja = !ninja;  // Alterna entre mostrar u ocultar botones
  }
}

void keyPressed (){  //reincio programa presionando r
  if (key == 'r') {
    mouseX=600;
    mouseY=200;
    blanco = 255;
    ninja = true;
  }
}
