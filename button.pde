float kutuX;
float kutuY;
int yesButonX = 50;
int yesButonY = 500;
int kutuYukseklik = 50;
int kutuGenislik = 80;
boolean tiklandiMi = true;
String soru = "Repoya yıldız verecek misin?";
void setup() {
  size(800, 600);
  background(100);
}

void draw() {
  
  if (tiklandiMi) {
    yerDegis();
    cizdirme(kutuX, kutuY, kutuGenislik, kutuYukseklik);
  }
  
  yesButonKontrolu();
  
  
  fill(0);
  textSize(25);
  text("Evet", yesButonX + 10, yesButonY + kutuYukseklik/2);

  tiklandiMi = tiklandimi();
  fill(255);
  textSize(50);
  text(soru, width/4 - 75, 100);
}
boolean tiklandimi() {
  return mouseX > kutuX && mouseX < kutuX +kutuGenislik && mouseY > kutuY && mouseY < kutuY +kutuGenislik;
}

void yerDegis() {
  kutuX = random(width - kutuGenislik);
  kutuY = random(300, 500 - kutuYukseklik);
}

void cizdirme(float kutuX, float kutuY, int kutuGenislik, int kutuYukseklik) {
  temizle();
  noStroke();
  rect(kutuX, kutuY, kutuGenislik, kutuYukseklik);
  fill(0);
  textSize(25);
  text("Hayır", kutuX + 10, kutuY + kutuYukseklik/2);
}


void temizle() {
  background(100);
}

boolean butonaTiklandiMi(int butonX, int butonY, int buttonGenislik, int buttonYukseklik) {
    boolean kutununIcindeMi = mouseX > butonX && mouseX < butonX + buttonGenislik && mouseY > butonY && mouseY < butonY + buttonYukseklik;
    boolean tiklandiMi = mousePressed;
    return tiklandiMi && kutununIcindeMi;
}

void yesButonKontrolu(){
  fill(255);
  rect(yesButonX, yesButonY, kutuGenislik, kutuYukseklik);
  
  if(butonaTiklandiMi(yesButonX, yesButonY, kutuGenislik, kutuYukseklik)) {
     temizle();
     soru = "tamam"; 
  } 
}
