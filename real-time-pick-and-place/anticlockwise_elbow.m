function anticlockwise_elbow(a)        

  writePWMDutyCycle(a,'D44',0);
  writePWMDutyCycle(a,'D45',1);
  writePWMDutyCycle(a,'D2',0);

  %writeDigitalPin(a, 'D44', 0);
  %writeDigitalPin(a, 'D45', 1);
  %writeDigitalPin(a,'D2', 0);

end