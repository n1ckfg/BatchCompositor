PImage img1, img2;
int levelsMinVal = 100;
int levelsMaxVal = 190;
int numPhotos = 284;
int counter = 1;

void setup() {
  size(50, 50);
}

void draw() { 
  String num = zeroPadding(counter, numPhotos);
  img1 = loadImage("001/img" + num + ".png");
  img2 = loadImage("002/img" + num + ".png");
  img1 = levels(img1, levelsMinVal, levelsMaxVal);
  
  PGraphics gfx = createGraphics(img1.width, img1.height, JAVA2D);
  
  gfx.beginDraw();
  gfx.blendMode(NORMAL);
  gfx.image(img1, 0, 0);
  gfx.filter(DILATE);
  gfx.blendMode(MULTIPLY);
  gfx.image(img2, 0, 0);
  gfx.endDraw();
  
  gfx.save("render/output" + num + ".png");
  
  counter++;
  if (counter > numPhotos) exit();
}

PImage levels(PImage img, float minVal, float maxVal) {
  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    float pxl = red(img.pixels[i]);
    img.pixels[i] = color(map(pxl, minVal, maxVal, 0, 255));
  }
  img.updatePixels();
  return img;
}

String zeroPadding(int _val, int _maxVal){
  String q = ""+_maxVal;
  return nf(_val,q.length());
}
