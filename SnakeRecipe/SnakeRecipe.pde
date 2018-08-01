
// 1. Follow the recipe instructions inside the Segment class.

// This class will be used to represent each part of the moving snake.

class Segment {
  //----------------------------------------------------------------------------------------------------------------------------------\\
  //2. Create x and y member variables to hold the location of each segment.
  double x;
  double y;
  //----------------------------------------------------------------------------------------------------------------------------------\\
  // 3. Add a constructor with parameters to initialize each variable.
  Segment (double x, double y) {
    this.x = x;
    this.y = y;
  }
  //----------------------------------------------------------------------------------------------------------------------------------\\
  // 4. Add getter and setter methods for both the x and y member variables.
  public double GetX() {
    return x;
  }
  void SetX (double i) {
    x=i;
  }
  double GetY() {
    return y;
  }
  void SetY (double i) {
    y=i;
  }
}
//----------------------------------------------------------------------------------------------------------------------------------\\
// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment head;

//----------------------------------------------------------------------------------------------------------------------------------\\
// 6. Create and initialize String to hold the direction of your snake e.g. "up"
String direction = "up";
//----------------------------------------------------------------------------------------------------------------------------------\\
// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
int piecesOfFood = 0;
//----------------------------------------------------------------------------------------------------------------------------------\\
// 8. Create and initialize foodX and foodY variables to hold the location of the food.

// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

int foodX = ((int)random(50)*10);
int foodY = ((int)random(50)*10);

//----------------------------------------------------------------------------------------------------------------------------------\\
void setup() {
  //----------------------------------------------------------------------------------------------------------------------------------\\
  // 9. Set the size of your sketch (500 by 500).
  size(500, 500);
  //----------------------------------------------------------------------------------------------------------------------------------\\
  // 10. initialize your head to a new segment.
  head = new Segment((int)random(50)*10, (int)random(50)*10);
  //----------------------------------------------------------------------------------------------------------------------------------\\
  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(30);
  //----------------------------------------------------------------------------------------------------------------------------------\\
}
void draw() {
  background(0);
  //12. Call the drawFood, drawSnake, move, and collision methods.
  drawFood();
  drawSnake();
  move();
  collision();
  //----------------------------------------------------------------------------------------------------------------------------------\\
}
// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).
void drawFood() {
  rect(foodX, foodY, 10, 10);
}
//----------------------------------------------------------------------------------------------------------------------------------\\
//14. Draw the snake head
void drawSnake() {
  rect((float) head.GetX(), (float) head.GetY(), 10, 10);
  //test your code
}
//----------------------------------------------------------------------------------------------------------------------------------\\
// 15. Complete the move method below.
void move() {
  // 16. Create a switch statement using your direction variable. Depending on the direction, add a new segment to your snake.
  //This is an incomplete switch statement:
  int speed = 10;
  switch(direction) {
  case "up":
    head.SetY(head.GetY() - speed);
    break;
  case "down":
    head.SetY(head.GetY() + speed);
    break;
  case "left":
    head.SetX(head.GetX() - speed);
    break;
  case "right":
    head.SetX(head.GetX() + speed); 
    break;
  }
  //----------------------------------------------------------------------------------------------------------------------------------\\
  // 17. Call the checkBoundaries method to make sure the snake doesn't go off the screen.
  checkBoundaries();
  //----------------------------------------------------------------------------------------------------------------------------------\\
}
// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.
void keyPressed() {
  if (keyCode == UP && direction != "down") {
    direction = "up";
  } else if (keyCode == DOWN && direction != "up") {
    direction = "down";
  } else if (keyCode == RIGHT && direction != "left") {
    direction = "right";
  } else if (keyCode == LEFT && direction != "right") {
    direction = "left";
  }
}
//----------------------------------------------------------------------------------------------------------------------------------\\
// 19. check if your head is out of bounds (teleport your snake to the other side).
void checkBoundaries() {
  if (head.GetX()>=width) {
    head.SetX(.000000000000001);
  } 
  if (head.GetX()<=0) {
    head.SetX(width - .000000000000001);
  } 
  if (head.GetY()>=height) {
    head.SetY(.000000000000001);
  } 
  if (head.GetY()<=0) {
    head.SetY(height-.000000000000001);
  }
  //----------------------------------------------------------------------------------------------------------------------------------\\
  //20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)
}
//----------------------------------------------------------------------------------------------------------------------------------\\
// 21. Complete the missing parts of the collision method below.

void collision() {
  // If the segment is colliding with a piece of food...
  // Increase the amount of food eaten and set foodX and foodY to new random locations.
  if(head.GetX()>=foodX && head.GetX()<=foodX + 10 && head.GetY() <= foodY+10 && head.GetY() >= foodY) {
    piecesOfFood+=1;
    foodX = (int) random(0, width-10);
    foodY = (int) random(0, height-10);
  }
}
//----------------------------------------------------------------------------------------------------------------------------------\\
/**
 
 ** Part 2: making the tail
 
 **/
//----------------------------------------------------------------------------------------------------------------------------------\\
//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
  ArrayList<Segment> tail = new ArrayList<Segment>();
//----------------------------------------------------------------------------------------------------------------------------------\\
// 2. Complete the missing parts of the manageTail method below.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
  drawTail();
  checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  tail.add(new Segment(head.GetX(), head.GetY()));
  // While the snake size is greater than your food, remove the first Segment in your snake.
  while (tail.size()>piecesOfFood) {
    tail.remove(0);
  }
}

void drawTail() {
  // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
  for(int i = 0; i<=tail.size();i++){
    Segment s = tail.get(i);
    rect((float) s.GetX(), (float) s.GetY(), 10, 10);
  }
}
//----------------------------------------------------------------------------------------------------------------------------------\\
// 3. Complete the missing parts of the checkTailCollision method below.
void checkTailCollision() {
  // If your head has the same location as one of your segments...
  if(head.GetX()>=tail.get(i).GetX() && head.GetX()<=foodX + 10 && head.GetY() <= foodY+10 && head.GetY() >= foodY) {
    
  }
  // Set food back to 1.

  //Call this method at the begining of your manageTail method.
}
//----------------------------------------------------------------------------------------------------------------------------------\\