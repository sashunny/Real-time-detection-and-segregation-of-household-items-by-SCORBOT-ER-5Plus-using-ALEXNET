function closing_gripper(a)        

  writeDigitalPin(a, 'D33', 0);
  writeDigitalPin(a, 'D32', 1);
  writeDigitalPin(a,'D6', 0);

end