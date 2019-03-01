

int Screen = 1;
float Speed = 10;
int clicked=0;

PImage sea;
int seaX = 800;
int seaY = 800;

PImage ocean;
int oceanX = 800;
int oceanY = 800;

PImage water;
int waterY = 800;
int waterX = 800;


PImage coral;
float coralX = 600;
float coralY = 200;

PImage whale;
float whaleY = -200;
float whaleX = 100;

PImage bubble;
int bubbleXs = 900;
int bubbleYs = 100;

PImage orca;
float orcaX = 400;
float orcaY = 400;

PImage fish;

int [] Xs = new int [40];
int [] Ys = new int [40];

int [] Speeds = new int [40];



void setup ()

{

  size (1000, 800);
  fish = loadImage ("fish.png");
  fish.resize (50, 50);

  for (int i = 0; i < 40; i++)  
  {
    Xs [i] = 100 * (i + 1);
    Ys [i] = 100 * (i + 1);
  }

  int i = 0;
  while (i < 40)
  {
    Speeds [i] = (int)random (1, 3);
    i = i + 1;
  }



  sea = loadImage ("sea.jpg");
  sea.resize (1000, 800);

  ocean = loadImage ("ocean.jpg");
  ocean.resize (1000, 800);

  water = loadImage ("water.png");
  water.resize (1000, 800);

  coral = loadImage ("coral.png");
  coral.resize (150, 150);

  whale = loadImage ("whale.png");
  whale.resize (600, 600);

  bubble = loadImage ("bubble.png");
  bubble.resize (40, 40);

  orca = loadImage ("orca.png");
  orca.resize (300, 300);
}

void draw ()


{

  if (mouseX < 100) 
  {
    cursor(fish, 0, 0);
  }

  if (Screen == 1)
  {
    background (sea);
    image (coral, coralY, coralX);
  }


  if (Screen == 2)
  {
    background (ocean);
  }

  if (Screen == 3)

  {
    background (water);
    image (coral, coralY, coralX);
  }






  image (whale, whaleX, whaleY);
  image (bubble, bubbleXs, bubbleYs);
  image (orca, orcaY, orcaX);

  int i=0;
  if (clicked == 1)
  {
    while (i < 40)
    {

      image (bubble, Xs[i], Ys[i]);

      bubbleYs = bubbleYs - 2;
      Ys [i] = Ys [i] + Speeds [i];



      if (Ys [i] > 800)
      {
        Ys[i]=0;
      }

      if (Ys [i] > 0 )
      {
        if (Xs [i] < 0)
        {

          Xs = new int [40];
        }
      }

      i=i+1;
    }
  }



  if (clicked == 0) 
  {

    while (i < 40)
    {

      image (bubble, Xs[i], Ys[i]);

      bubbleYs = bubbleYs -2;
      Ys [i] = Ys [i] - Speeds [i];



      if (Ys [i] < 0)
      {
        Ys[i]=800;
      }

      if (Ys [i] < 0 )
      {
        if (Xs [i] < 0)
        {

          Xs = new int [40];
        }
      }

      i=i+1;
    }
  }


  if (Screen == 4)

  {
    background (191, 230, 255);
    textSize (22);
    text ("HELP", 450, 100);
    text ("use the keys 'w', 'a', 's' and 'd' to move the whale", 200, 300);
    text ("use the keys 'i', 'j', 'k' and 'l' to move the orca", 200, 400);
    text ("click on the whale to reverse the direction of the bubbles", 200, 500 );
  }
}


void keyPressed ()

{

  if (key == '1')

  {
    Screen = 1;
  }

  if (key == '2')

  { 
    Screen = 2;
  }

  if (key == '3')

  {

    Screen = 3;
  }

  if (key == '4')
  {
    Screen = 4;
  }


  if (key == 'w')

  {

    whaleY = whaleY - Speed;
  }

  if (key == 'a')

  {
    whaleX = whaleX - Speed;
  }

  if (key == 's')

  {
    whaleY = whaleY + Speed;
  }

  if (key == 'd')

  {
    whaleX = whaleX + Speed;
  }

  if (key == 'j')
  {
    orcaY = orcaY - Speed;
  }

  if (key == 'l')
  {
    orcaY = orcaY + Speed;
  }

  if (key == 'i')
  {
    orcaX = orcaX - Speed;
  }

  if (key == 'k')
  {
    orcaX = orcaX + Speed;
  }
}

void mouseReleased ()

{
  clicked = 0;
  println(mouseY - whaleY);
  if (  mouseX - whaleX  > 0)
  {
    if (  mouseX - whaleX  < 500)
    {
      if (  mouseY - whaleY  > 200)
      {
        if (  mouseY - whaleY  < 300)
        {
          clicked=1;
        }
      }
    }
  }
}
