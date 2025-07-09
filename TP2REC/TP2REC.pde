PImage mario1, mario2, mario3, mario4;
int pantalla = 0;
int tiempoInicio;
int duracion = 4000; // milisegundos 
float posYTexto = 500;
boolean reiniciar = false;

PFont fuente;

// Frases individuales
String texto1 = "Mario Bross es un juego clásico de plataformas.";
String texto2 = "Mario enfrentará enemigos como Goombas y Browser.";
String texto3 = "Su misión es rescatar a la princesa Peach.";
String texto4 = "¿Estás listo para jugar esta aventura?";

void setup() {
  size(640, 480);
  
  mario1 = loadImage("mario1.jpg");
  mario2 = loadImage("mario2.jpg");
  mario3 = loadImage("mario3.png");
  mario4 = loadImage("mario4.png");
  
  fuente = loadFont("BodoniMTCondensed-Bold-32.vlw");
  textFont(fuente);
  textAlign(CENTER, CENTER);
  
  tiempoInicio = millis();
}

void draw() {
  background(255);

  // Mostrar imagen según pantalla
  switch (pantalla) {
    case 0:
      image(mario1, 0, 0, width, height);
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

  // Animar texto hacia arriba
  if (posYTexto > height - 60) {
    posYTexto -= 2;
  }

  // Mostrar texto según pantalla
  fill(0);
  if (pantalla == 0) {
    text(texto1, width / 2, posYTexto);
  } else if (pantalla == 1) {
    text(texto2, width / 2, posYTexto);
  } else if (pantalla == 2) {
    text(texto3, width / 2, posYTexto);
  } else if (pantalla == 3) {
    text(texto4, width / 2, posYTexto);
  }

  // Cambiar de pantalla por tiempo
  if (millis() - tiempoInicio > duracion) {
    pantalla++;
    tiempoInicio = millis();
    posYTexto = 500;
  }

  // Fin de presentación
  if (pantalla >= 4) {
    background(0);
    fill(255);
    text("Fin de la presentación", width / 2, height / 2 - 40);

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
