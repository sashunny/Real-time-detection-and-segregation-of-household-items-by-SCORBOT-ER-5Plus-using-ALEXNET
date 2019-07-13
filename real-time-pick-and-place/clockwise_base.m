function clockwise_base(a)        

  
  writePWMDutyCycle(a, 'D9', 0);
  writePWMDutyCycle(a, 'D8', 1);
  writePWMDutyCycle(a,'D5', 0);

end