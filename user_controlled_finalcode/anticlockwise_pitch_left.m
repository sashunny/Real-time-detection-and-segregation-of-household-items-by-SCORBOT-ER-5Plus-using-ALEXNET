function anticlockwise_pitch_left(a)        

  writeDigitalPin(a, 'D34', 1);
  writeDigitalPin(a, 'D35', 0);
  writeDigitalPin(a,'D7', 0);

end