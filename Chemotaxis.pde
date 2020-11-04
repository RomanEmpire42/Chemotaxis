Walker[] particles;
int centerX = 0;
int centerY = 0;
boolean explode = false;

void setup() {
  size(500, 500);
  particles = new Walker[20];
  for (int i = 0; i < particles.length; i++){
    particles[i] = new Walker();
  }
}
void draw() {
  background(0);
  for (int i = 0; i < particles.length; i++){
    if (!mousePressed && !explode) {
      particles[i].walk();
    } else if(mousePressed && mouseButton == LEFT) {
      particles[i].gravityWalk();
    } else if(mousePressed && mouseButton == RIGHT){
      particles[i].mouseWalk();
    } else if(!mousePressed && explode == true){
       particles[i].explode();
    }
    particles[i].show();
  }
  centerX = 0;
  centerY = 0;
  for (int i = 0; i < particles.length; i++){
    centerX += particles[i].myX;
    centerY += particles[i].myY;
  }
  centerX = centerX / particles.length;
  centerY = centerY / particles.length;
}
void keyPressed()
{
  if (key == ' ')
    {
      explode = true;
    }
}
void keyReleased()
{
  if (key == ' ')
    {
      explode = false;
    }
}
class Walker {
  int myX, myY, myC;
  Walker() {
    myC = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    myX = (int) (Math.random()*300) + 100;
    myY = (int) (Math.random()*300) + 100;
  }
   Walker(int x_, int y_) {
   myX = x_;
   myY = y_;
   }  
  void walk() {
    int tempX = myX + ((int)(Math.random()*3) - 1)*2;
    int tempY = myY + ((int)(Math.random()*3) - 1)*2;
    myX = tempX;
    myY = tempY;
  }
  void gravityWalk() {
    if (myX > centerX)
      myX += (int)(Math.random()*3) - 5;//-5, -4, -3
    else
      myX += (int)(Math.random()*3) + 3;//3, 4, 5
    if (myY > centerY)
      myY += (int)(Math.random()*3) - 5;//-5, -4, -3
    else
      myY += (int)(Math.random()*3) + 3;//3, 4, 5
  }
  void mouseWalk() {
    if (myX > mouseX)
      myX += (int)(Math.random()*3) - 5;//-5, -4, -3
    else
      myX += (int)(Math.random()*3) + 3;//3, 4, 5
    if (myY > mouseY)
     myY += (int)(Math.random()*3) - 5;//-5, -4, -3
    else
      myY += (int)(Math.random()*3) + 3;//3, 4, 5
  }
  void explode() {
    // basically opposite of gravityWalk
    if (myX > centerX)
      myX += (int)(Math.random()*3) + 3;//3, 4, 5 
    else
      myX += (int)(Math.random()*3) - 5;//-5, -4, -3

    if (myY > centerY)
      myY += (int)(Math.random()*3) + 3;//3, 4, 5
    else
      myY += (int)(Math.random()*3) - 5;//-5, -4, -3
  }
  void show() {
    fill(myC);
    ellipse(myX, myY, 25, 25);
  }
}
