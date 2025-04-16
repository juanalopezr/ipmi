
PImage lotsopeluche;


void setup (){
  size (800, 400);
  background (150);
lotsopeluche = loadImage("lotsopeluche.jpg");

  
}


void draw (){
background (255);  
image (lotsopeluche , 0, 0, 400, 400);

println ("X:");
println (mouseX);
println ("Y:");
println (mouseY);

line (400,0,400,400);

//orejas
 fill(179,36,54); 
 stroke(178,90,116);
 strokeWeight(1);
 circle(511, 97, 70); 
 circle(670, 97, 70);
  //parte blanca oreja
 fill(255); 
 noStroke();
 circle(520, 110, 34);
 circle(660, 110, 34);
  //cara
fill(179,36,54);
stroke (179,36,54);
circle (590, 190, 210);
//mancha blanca cara
fill (255);
ellipse (590,205,150,110);
//nariz
fill (98,34,72);
stroke (0);
strokeWeight (3);
ellipse (590,170,50,30);
//ojo blanco
fill(255);
circle (560,130,40);
circle (620,130,40);
//pupila marron
fill(131,84,66);
circle(555,140,18);
circle(615,140,18);
//pupila negra
fill (0);
circle (554,140,5);
circle (614,140,5);
//sonrisa
noFill ();
stroke(0);
strokeWeight(3);
arc (590,215,80,40,0, PI); //esto seria la posicion en la cual se va a encontrar
// cejas
stroke(60, 20, 40); // color marrón oscuro
strokeWeight(6);
noFill();
// ceja izquierda
arc(560, 113, 40, 20, PI, TWO_PI);
// ceja derecha
arc(620, 110, 40, 20, PI, TWO_PI);

}
