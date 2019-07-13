function clockwise_base(a)        

  
  writePWMDutyCycle(a, 'D9', 0);
  writePWMDutyCycle(a, 'D8', 0.25);
  writePWMDutyCycle(a,'D5', 0);

end