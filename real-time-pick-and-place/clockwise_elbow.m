function clockwise_elbow(a)        

  writePWMDutyCycle(a,'D44',1);
  writePWMDutyCycle(a,'D45',0);
  writePWMDutyCycle(a,'D2',0);
  %writeDigitalPin(a, 'D44', 1);
  %writeDigitalPin(a, 'D45', 0);
  %writeDigitalPin(a,'D2', 0);

end