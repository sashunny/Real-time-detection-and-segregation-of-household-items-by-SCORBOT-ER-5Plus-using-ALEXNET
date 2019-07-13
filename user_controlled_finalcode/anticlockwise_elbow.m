function anticlockwise_elbow(a)        

  writePWMDutyCycle(a,'D44',0);
  writePWMDutyCycle(a,'D45',0.5);         %change the duty cycle to change the speed(0 to 1)
  writePWMDutyCycle(a,'D2',0);

end
