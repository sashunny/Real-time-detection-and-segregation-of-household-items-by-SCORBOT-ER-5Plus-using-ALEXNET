function oppening_gripper(a)        

  writeDigitalPin(a, 'D33', 1);
  writeDigitalPin(a, 'D32', 0);
  writeDigitalPin(a,'D6', 0);

end