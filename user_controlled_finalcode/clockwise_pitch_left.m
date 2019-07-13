function clockwise_pitch_left(a)        

  writeDigitalPin(a, 'D34', 0);
  writeDigitalPin(a, 'D35', 1);
  writeDigitalPin(a,'D7', 0);

end