import processing.video.*;

Movie movie;
int v=1,a;
PImage uno,dos,tres, salir;

void setup()
{
  size (640,360);
  
  movie = new Movie (this,"video2.mp4");
  
  uno = loadImage("pantallaUno.jpg");
  
  
  
}

void draw()
{
  //pantalla de presentación
  if (v==1)
  {
    image (uno,0,0,width,height);
    println (v);
    
    //Siguiente pantalla
    if (keyPressed==true && key=='m' || key=='M')
  {
   v=3;
    println ("Siguiente pantalla");   
  } 
  }
    
  //pantalla dos para instrucciones
  if (v==3)
  {
     video();  
  }
}


void video()
{
 background (255);
 
 //movie.filter(DILATE);
 //movie.filter (GRAY);
 
 image (movie,0,0,width,height);
 movie.loop();
 
 keyPressed();

}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed()
{
  switch (key)
  {
    //sepia
    case 'z':
    tint (150, 100, 49);
    break;
    
    //blanco y negro
    case 'x':
    movie.filter (GRAY);
    
    break;
   
    //
    case 'c':
    noTint();
    //para quitar el filtro
    movie.filter (ERODE);
    break;
    
    case 'v':
    movie.filter (INVERT);
    break;
    
    case 'b':
    noTint();
    movie.filter (NORMAL);
    break;
    
    case 'n':
    exit();
    break;
  }
}