function anticlockwise_base(a)        

  writePWMDutyCycle(a, 'D9', 0.25);    %change the duty cycle to change the speed
  writePWMDutyCycle(a, 'D8', 0);
  writePWMDutyCycle(a,'D5', 0);

end
