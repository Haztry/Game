float ballX = 200;
float ballY = 100;
float speedX = 20;
float speedY = 0;
int hit = 0;
int miss = 0;
void setup() {
  size(600,400);
}
void draw() {
  //Nos vuelve a reiniciar el contador y los misses
  if(mousePressed) {hit = 0; miss = 0;}
  //El paddle va de la mano junto con el hit, esto debido a que si le damos en mousePressed, se reinicia la longitud
  float paddle = 1000/ (hit+10);
  //Este condicional nos marca los limites de nuestros frames y al llegar a la pared de lado derecho se regresa con el -speedX
  if(ballX < 0 || ballX > width) speedX = -speedX;

  //Este condicional hace que la pelota pueda rebotar, si al pasar en el eje de las y mayor a width cambia su sentido con el -speed. También establece la altura, en este caso le 
  //pongo 355 para que de la impresion de que no se desborda 
  if(ballY > 355) {
    speedY = -speedY;// Cambia su dirección
    float distance = abs(mouseX - ballX);//Mantiene los valores absolutos, se trabaja mejor y es m'as fluido.
    
    //Este condicional nos dice que si la distancia dentro de todo lo que es el paddle, nos aumentará 1 hit, lo cual reconoce, de lo contrario lo marcará como fallido si la pelota no le da.
    if (distance < paddle) hit += 1;
    else miss += 1;
  } else speedY += 1;
  ballX += speedX;
  ballY += speedY;
  
  //Color de fondo y pelota
  background(100,200,50);
  
  //color de pelota
  fill(255); 
  ellipse(ballX,ballY,50,50);
  
  //Color de paddle
  fill(50,100,20); 
  
  //nuestro cursor, que incluye coordenadas del mouse
  rect(mouseX-paddle,height-10,2*paddle,30);//el mouseX- paddle nos ayuda a abarcar todo el paddle para que no haya errores

// color de los textos
fill (0); 

//
text ("hit: " + hit, 10, 20);
text ("miss: " + miss, 10, 40);
text ("Omar Millan",300,20);
}
