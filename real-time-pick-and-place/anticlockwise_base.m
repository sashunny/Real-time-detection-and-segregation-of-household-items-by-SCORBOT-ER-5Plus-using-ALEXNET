function anticlockwise_base(a)        

  writePWMDutyCycle(a, 'D9', 1);
  writePWMDutyCycle(a, 'D8', 0);
  writePWMDutyCycle(a,'D5', 0);

end