int potPin = A0;
float pwmValue = 0;

void setup() {
  Serial.begin(115200);
}

void loop() {
  float x = analogRead(potPin);   // 0–1023
  // Serial.println(x);
  pwmValue = map(x, 0, 1023, 0, 5);
  Serial.println(pwmValue);
  delayMicroseconds(2000);      // ~500 Hz sampling
}
