function clockwise_pitch_right(a)        

  writePWMDutyCycle(a, 'D10', 1);
  writePWMDutyCycle(a, 'D11', 0);
  writePWMDutyCycle(a,'D3', 0);

end