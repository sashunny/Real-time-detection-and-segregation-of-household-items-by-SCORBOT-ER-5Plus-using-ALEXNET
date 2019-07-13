function softstopit_gripper(a)        

  writeDigitalPin(a, 'D33', 0);
  writeDigitalPin(a, 'D32', 0);
  writeDigitalPin(a,'D6', 0);

end