function clockwise_shoulder(a)        

  writePWMDutyCycle(a,'D13',0.3);
  writePWMDutyCycle(a,'D12',0);
  %writePWMDutyCycle(a,'D4',0);
  %writeDigitalPin(a, 'D13', 1);
  %writeDigitalPin(a, 'D12', 0);
  writeDigitalPin(a,'D4', 0);

end