final int MAX = 1000;
final int MIN_BORDER = 15;
final int MAX_BORDER = 15;

final color BG_COLOR 		 = color(#EFEFEF);
final color FG_COLOR     = color(#F6F6F6);
final color BORDER_COLOR = color(20, 20, 20);

ArrayList<Particle> particles;
int[] list;
int posX, posY;
PVector axis;
PFont font;
int count;
char[] typedText = 'ovrs';
ArrayList inputText;

void setup() 
{

	
	// Configuración de la escena
  colorMode(RGB, 255, 255, 255);
  size(1200, 600);
	background(BG_COLOR);
  frameRate(30);
  noStroke();
  noCursor();
	
	// Cargamos la fuente
  font = createFont("Albondigas_Italic.ttf", 300);
  textFont(font);
  fill(0);
  textAlign(CENTER, CENTER);
  text(typedText, width/2, height/2 - 70);
	typedText = "";
	inputText = new ArrayList<char>;
	
	count = 0;
  list = new int[width*height];
  loadPixels();
	
  for(int y = 0; y <= height - 1; y++) {
    for(int x = 0; x <= width - 1; x++) {
      color pb = pixels[y*width + x];
      if(red(pb) < 5) {  
				list[y*width + x] = 0;  
			} else {  
				list[y*width + x] = 1;  
			}
		}
	}
  updatePixels();
  
  particles = new ArrayList<Particle>();
}

void draw() 
{
   if (count < MAX) {
    int i=0;  while(i<3){
      axis = new PVector(int(random(100,width-100)),int(random(100,height-100)));
      if(list[int(axis.y*width+axis.x)]==0){
        particles.add(new Particle(axis.x,axis.y));
        i++;
        count++;
      }
    }
  }
  background(BG_COLOR);
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    fill(BORDER_COLOR);
    p.display();
    p.update();
  }
  for (int j = 0; j < particles.size(); j++) {
    Particle p = particles.get(j);
    fill(FG_COLOR);
    p.display2();
    p.update();
  }
}

void keyReleased() 
{
	if (key == ENTER || key == RETURN) {
		typedText = join(inputText.toArray(), '');
		// println(typedText);
		setup();
	} else {
		inputText.add(key);
	}
		
}