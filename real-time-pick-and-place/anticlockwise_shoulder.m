function anticlockwise_shoulder(a)        

  writePWMDutyCycle(a,'D13',0);
  writePWMDutyCycle(a,'D12',1);
  writeDigitalPin(a,'D4', 0);

end