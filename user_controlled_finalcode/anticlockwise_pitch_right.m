function anticlockwise_pitch_right(a)        

  writePWMDutyCycle(a, 'D10', 0);
  writePWMDutyCycle(a, 'D11', 1);               %change the duty cycle to change the speed(0 to 1)
  writePWMDutyCycle(a,'D3', 0);

end
