class Particle {
  PVector location;
  PVector velocity;
  float scale;
  int radius;
	int border;
	int incBorder;
	int type;

  Particle(float x, float y) {
    location  = new PVector(x, y);
    velocity  = new PVector(random(2/3), random(2/3));
    scale     = random(0.35, 0.9);
    radius    = int(scale * 45);
		border    = MIN_BORDER + 1;		
		incBorder = 1;
		type      = int(random(2));
  }

  void update() {
    location.add(velocity);
    if ((list[int(location.y)*width+int(location.x+velocity.x)]==1)   ||   (list[int(location.y)*width+int(location.x-velocity.x)]==1)) {  velocity.x *= -1;  }
    if ((list[int(location.y+velocity.y)*width+int(location.x)]==1) || (list[int(location.y-velocity.y)*width+int(location.x)]==1)) {  velocity.y *= -1;  }
  }

  void display() 
	{
		if (type == 0) {
    	ellipse(location.x, location.y, radius, radius);
		} else {
			updateBorder();
			ellipse(location.x, location.y, radius + border, radius + border);
		}

  }
  
  void display2() 
	{
		if (type == 0) {
			updateBorder();
			ellipse(location.x, location.y, radius - border, radius - border);
		} else {
			ellipse(location.x, location.y, radius, radius);
		}
  }
	
	void updateBorder() 
	{
		if (border < MIN_BORDER || border > MAX_BORDER) {
			incBorder *= -1;
		}
		border += incBorder;
	}
}