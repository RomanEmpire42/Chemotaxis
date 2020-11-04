Walker[] particles;
void setup() {
  size(500, 500);
  particles = new Walker[10];
}
void draw() {
  background(0);
  for (int i = 0; i >= particles.length; i++){
    if (!mousePressed) {
      particles[i].walk();
    } else {
      particles[i].partialWalk();
    }
    particles[i].show();
  }
}
void mousePressed()
{
  
}
class Walker {
  int myX, myY, myC;
  Walker() {
    myC = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    myX = (int) (Math.random()*300) + 100;
    myY = (int) (Math.random()*300) + 100;
  }
   Walker(int x_, int y_, int c_) {
   myC = c_;
   myX = x_;
   myY = y_;
   }  
  void walk() {
    myX += ((int)(Math.random()*3) - 1)*2;  //-2, 0, 4
    myY += ((int)(Math.random()*3) - 1)*2;  //-2, 0, 4
  }
  void partialWalk() {
    if (myX > mouseX)
      myX += (int)(Math.random()*3) - 3;//-3, -2, -1
    else
      myX += (int)(Math.random()*3) + 3;//3, 4, 5
    if (myY > mouseY)
      myY += (int)(Math.random()*3) - 3;//-3, -2, -1
    else
      myY += (int)(Math.random()*3) + 3;//3, 4, 5
  }
  void show() {
    fill(myC);
    ellipse(myX, myY, 5, 5);
  }
}
