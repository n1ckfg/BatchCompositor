PImage img1, img2;
int numPhotos = 1;
int counter = 1;

void setup() {
  size(50, 50, P2D);
}

void draw() { 
  String num = zeroPadding(counter, 999);
  img1 = loadImage("001/img" + num + ".png");
  img2 = loadImage("002/img" + num + ".png");
  img1 = levels(img1, 127);
  
  surface.setSize(img1.width, img1.height);
  
  blendMode(NORMAL);
  image(img1, 0, 0);
  blendMode(MULTIPLY);
  image(img2, 0, 0);
  
  saveFrame("render/output" + num + ".png");
  counter++;
  if (counter > numPhotos) exit();
}

PImage levels(PImage img, float val) {
  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    float pxl = red(img.pixels[i]);
    img.pixels[i] = color(map(pxl, 0, val, 0, 255));
  }
  img.updatePixels();
  return img;
}

String zeroPadding(int _val, int _maxVal){
  String q = ""+_maxVal;
  return nf(_val,q.length());
}
