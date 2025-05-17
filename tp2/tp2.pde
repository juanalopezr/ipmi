PImage marioo1, mario2, mario3, mario4;
String[] textos = {
  "Mario Bross es un juego clásico de plataformas.",
  "Mario enfrentará enemigos como Goombas y Browser.",
  "Su misión es rescatar a la princesa Peach.",
  "¿Estás listo para jugar esta aventura?"
};

int pantalla = 0;
int tiempoInicio;
int duracion = 4000; // milisegundos 
float posYTexto = 500;
boolean reiniciar = false;

PFont fuente;

void setup() {
  size(640, 480);
  
  // imágenes
  marioo1 = loadImage("marioo1.jpg");
  mario2 = loadImage("mario2.jpg");
  mario3 = loadImage("mario3.png");
  mario4 = loadImage("mario4.jpg");
  
  // fuente
  fuente = loadFont("Impact-26.vlw");
  textFont(fuente);
  textAlign(CENTER, CENTER);
  
  tiempoInicio = millis();
}

void draw() {
  background(0);

  // Mostrar imagen según pantalla
  switch (pantalla) {
    case 0:
      image(marioo1, 0, 0, width, height);
      break;
    case 1:
      image(mario2, 0, 0, width, height);
      break;
    case 2:
      image(mario3, 0, 0, width, height);
      break;
    case 3:
      image(mario4, 0, 0, width, height);
      break;
  }

  // Texto animado
  if (posYTexto > height - 60) {
    posYTexto -= 2;
  }
  fill(0);
  text(textos[pantalla], width / 2, posYTexto);

  // Pasar de pantalla x tiempo
  if (millis() - tiempoInicio > duracion) {
    pantalla++;
    tiempoInicio = millis();
    posYTexto = 500; // reiniciar posición del texto
  }

  // Fin de la presentación
  if (pantalla >= 4) {
    background(0);
    fill(255);
    text("Fin de la presentación", width / 2, height / 2 - 40);

    // Botón de reinicio
    fill(0, 180, 0);
    rect(width / 2 - 75, height / 2, 150, 40);
    fill(255);
    text("REINICIAR", width / 2, height / 2 + 20);
    
    reiniciar = true;
    noLoop();
  }
}

void mousePressed() {
  if (reiniciar &&
      mouseX > width / 2 - 75 && mouseX < width / 2 + 75 &&
      mouseY > height / 2 && mouseY < height / 2 + 40) {
    pantalla = 0;
    tiempoInicio = millis();
    posYTexto = 500;
    reiniciar = false;
    loop();
  }
}
