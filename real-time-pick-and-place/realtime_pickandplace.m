clear a;
a = arduino;
% % the following lines will bring the shoulder, base and elbow to their 
% % zeroth position or simply to zero degree

voltage_s = readVoltage(a,'A14');                        % shoulder
degree_s =  (voltage_s - 2.5)*270/(-5);
        if(degree_s < 0)
            while degree_s < 0
                clockwise_shoulder(a);
                voltage_s =  readVoltage(a,'A14');
                degree_s = (voltage_s - 2.5)*270/(-5);
            end
        elseif(degree_s > 0)
            while degree_s > 0
                anticlockwise_shoulder(a);
                voltage_s =  readVoltage(a,'A14');
                degree_s = (voltage_s - 2.5)*270/(-5);
            end
        end 
        softstopit_shoulder(a);
        
voltage_e =  readVoltage(a,'A13');                       % elbow
degree_e =  (voltage_e - 2.5)*270/(-5);
        if(degree_e < 0)
            while degree_e < 0
                clockwise_elbow(a);
                voltage_e =  readVoltage(a,'A13');
                degree_e = (voltage_e - 2.5)*270/(-5);
            end
        elseif(degree_e > 0)
            while degree_e > 0
                anticlockwise_elbow(a);
                voltage_e =  readVoltage(a,'A13');
                degree_e = (voltage_e - 2.5)*270/(-5);
            end    
        end
        softstopit_elbow(a);
        
       
voltage_b =  readVoltage(a,'A15');                       % base
degree_b =  (voltage_b - 2.5)*270/(-5);
        if(degree_b < 0)
            while degree_b < 0
                clockwise_base(a);
                voltage_b =  readVoltage(a,'A15');
                degree_b = (voltage_b - 2.5)*270/(-5);
            end
        elseif(degree_b > 0)
            while degree_b > 0
                anticlockwise_base(a);
                voltage_b =  readVoltage(a,'A15');
                degree_b = (voltage_b - 2.5)*270/(-5);
            end
        end
        softstopit_base(a); 
% % the following part is to detect the object 
cam = webcam;                           %open the webcam
im = snapshot(cam);                     %take a picture from the webcam
I = imresize(im,[227 227]);             %resize it according to the input size of the neural network
label = classify(trained_network, I);   %detect the object inside the image
imshow(I)                               %show the image
text(10,20,char(label),'Color','red');  %add the name of the detected image on the figure
c = {'tape','duster','glass','cup'};    %object names/classes
class = categorical(c);                 %covert into categorical

% % the following lines are to move the joints according to the object's
% % initial and final position
if (label(1,1) == class(1,4) )          %% cup
    voltage_one = readVoltage(a,'A15');
    degree_one =  (voltage_one - 2.5)*270/(-5);
    while degree_one > -50
                anticlockwise_base(a);
                voltage_one =  readVoltage(a,'A15');
                degree_one = (voltage_one - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
    voltage_two =  readVoltage(a,'A14');
    degree_two =  (voltage_two - 2.5)*270/(-5);
    while degree_two < 10
        clockwise_shoulder(a);
        voltage_two =  readVoltage(a,'A14');
        degree_two = (voltage_two - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    voltage_three =  readVoltage(a,'A13');
    degree_three =  (voltage_three - 2.5)*270/(-5);
    while degree_three < 43
        clockwise_elbow(a);
        voltage_three =  readVoltage(a,'A13');
        degree_three = (voltage_three - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    closing_gripper(a);
    pause(0.5);
    softstopit_gripper(a);
    
    voltage_four =  readVoltage(a,'A14');
    degree_four =  (voltage_four - 2.5)*270/(-5);
    while degree_four > 0
        anticlockwise_shoulder(a);
        voltage_four =  readVoltage(a,'A14');
        degree_four = (voltage_four - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    voltage_five =  readVoltage(a,'A15');
    degree_five =  (voltage_five - 2.5)*270/(-5);
    while degree_five < 0
        clockwise_base(a);
        voltage_five =  readVoltage(a,'A15');
        degree_five = (voltage_five - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
    oppening_gripper(a);
    pause(0.6);
    softstopit_gripper(a);
    
    voltage_six =  readVoltage(a,'A13');
    degree_six =  (voltage_six - 2.5)*270/(-5);
    while degree_six > 0
        anticlockwise_elbow(a);
        voltage_six =  readVoltage(a,'A13');
        degree_six = (voltage_six - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
   
elseif (label(1,1) == class(1,2))               %%duster
    voltage_one = readVoltage(a,'A15');
    degree_one =  (voltage_one - 2.5)*270/(-5);
    while degree_one > -48
                anticlockwise_base(a);
                voltage_one =  readVoltage(a,'A15');
                degree_one = (voltage_one - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
    voltage_two =  readVoltage(a,'A14');
    degree_two =  (voltage_two - 2.5)*270/(-5);
    while degree_two < 25
        clockwise_shoulder(a);
        voltage_two =  readVoltage(a,'A14');
        degree_two = (voltage_two - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    voltage_three =  readVoltage(a,'A13');
    degree_three =  (voltage_three - 2.5)*270/(-5);
    while degree_three < 0.5
        clockwise_elbow(a);
        voltage_three =  readVoltage(a,'A13');
        degree_three = (voltage_three - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    closing_gripper(a);
    pause(0.6);
    softstopit_gripper(a);
    
    voltage_four =  readVoltage(a,'A14');           
    degree_four =  (voltage_four - 2.5)*270/(-5);
    while degree_four > (-70)
        anticlockwise_shoulder(a);
        voltage_four =  readVoltage(a,'A14');
        degree_four = (voltage_four - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    voltage_five =  readVoltage(a,'A13');
    degree_five =  (voltage_five - 2.5)*270/(-5);
    while degree_five < 129
        clockwise_elbow(a);
        voltage_five =  readVoltage(a,'A13');
        degree_five = (voltage_five - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    voltage_six =  readVoltage(a,'A15');
    degree_six =  (voltage_six - 2.5)*270/(-5);
    while degree_six < 60
        clockwise_base(a);
        voltage_six =  readVoltage(a,'A15');
        degree_six = (voltage_six - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
    voltage_seven =  readVoltage(a,'A14');
    degree_seven =  (voltage_seven - 2.5)*270/(-5);
    while degree_seven < -50
        clockwise_shoulder(a);
        voltage_seven =  readVoltage(a,'A14');
        degree_seven = (voltage_seven - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    voltage_eight =  readVoltage(a,'A13');
    degree_eight =  (voltage_eight - 2.5)*270/(-5);
    while degree_eight < 129
        clockwise_elbow(a);
        voltage_eight =  readVoltage(a,'A13');
        degree_eight = (voltage_eight - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    oppening_gripper(a);
    pause(0.6);
    softstopit_gripper(a);
    
    voltage_nine =  readVoltage(a,'A15');
    degree_nine =  (voltage_nine - 2.5)*270/(-5);
    while degree_nine > 0
        anticlockwise_base(a);
        voltage_nine =  readVoltage(a,'A15');
        degree_nine = (voltage_nine - 2.5)*270/(-5);
    end
    softstopit_base(a); 
    
    voltage_ten =  readVoltage(a,'A13');
    degree_ten =  (voltage_ten - 2.5)*270/(-5);
    while degree_ten > 0
        anticlockwise_elbow(a);
        voltage_ten =  readVoltage(a,'A13');
        degree_ten = (voltage_ten - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    voltage_eleven =  readVoltage(a,'A14');
    degree_eleven =  (voltage_eleven - 2.5)*270/(-5);
    while degree_eleven < 0
        clockwise_shoulder(a);
        voltage_eleven =  readVoltage(a,'A14');
        degree_eleven = (voltage_eleven - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
elseif (label(1,1) == class(1,1))                    %%tape
    voltage_one = readVoltage(a,'A15');
    degree_one =  (voltage_one - 2.5)*270/(-5);
    while degree_one > -50
                anticlockwise_base(a);
                voltage_one =  readVoltage(a,'A15');
                degree_one = (voltage_one - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
    voltage_two =  readVoltage(a,'A14');
    degree_two =  (voltage_two - 2.5)*270/(-5);
    while degree_two < 10
        clockwise_shoulder(a);
        voltage_two =  readVoltage(a,'A14');
        degree_two = (voltage_two - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    voltage_three =  readVoltage(a,'A13');
    degree_three =  (voltage_three - 2.5)*270/(-5);
    while degree_three < 45
        clockwise_elbow(a);
        voltage_three =  readVoltage(a,'A13');
        degree_three = (voltage_three - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    closing_gripper(a);
    pause(0.5);
    softstopit_gripper(a);
    
    voltage_four =  readVoltage(a,'A14');
    degree_four =  (voltage_four - 2.5)*270/(-5);
    while degree_four > -12
        anticlockwise_shoulder(a);
        voltage_four =  readVoltage(a,'A14');
        degree_four = (voltage_four - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    voltage_five =  readVoltage(a,'A13');
    degree_five =  (voltage_five - 2.5)*270/(-5);
    while degree_five < 100
        clockwise_elbow(a);
        voltage_five =  readVoltage(a,'A13');
        degree_five = (voltage_five - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    voltage_six =  readVoltage(a,'A15');
    degree_six =  (voltage_six - 2.5)*270/(-5);
    while degree_six < 15
        clockwise_base(a);
        voltage_six =  readVoltage(a,'A15');
        degree_six = (voltage_six - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
    voltage_seven =  readVoltage(a,'A14');
    degree_seven =  (voltage_seven - 2.5)*270/(-5);
    while degree_seven < -8
        clockwise_shoulder(a);
        voltage_seven =  readVoltage(a,'A14');
        degree_seven = (voltage_seven - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    oppening_gripper(a);
    pause(0.5);
    softstopit_gripper(a);
    
    voltage_eight =  readVoltage(a,'A13');
    degree_eight =  (voltage_eight - 2.5)*270/(-5);
    while degree_eight > 0
        anticlockwise_elbow(a);
        voltage_eight =  readVoltage(a,'A13');
        degree_eight = (voltage_eight - 2.5)*270/(-5);
    end  
    softstopit_elbow(a);
    
elseif (label(1,1) == class(1,3))                  %%glass
    
    voltage_one = readVoltage(a,'A15');
    degree_one =  (voltage_one - 2.5)*270/(-5);
    while degree_one > -50
                anticlockwise_base(a);
                voltage_one =  readVoltage(a,'A15');
                degree_one = (voltage_one - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
    voltage_three =  readVoltage(a,'A13');
    degree_three =  (voltage_three - 2.5)*270/(-5);
    while degree_three < 50
        clockwise_elbow(a);
        voltage_three =  readVoltage(a,'A13');
        degree_three = (voltage_three - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    closing_gripper(a);
    pause(0.25);
    softstopit_gripper(a);
    
    voltage_four =  readVoltage(a,'A14');
    degree_four =  (voltage_four - 2.5)*270/(-5);
    while degree_four > -20
        anticlockwise_shoulder(a);
        voltage_four =  readVoltage(a,'A14');
        degree_four = (voltage_four - 2.5)*270/(-5);
    end
    softstopit_shoulder(a);
    
    voltage_five =  readVoltage(a,'A13');
    degree_five =  (voltage_five - 2.5)*270/(-5);
    while degree_five < 75
        clockwise_elbow(a);
        voltage_five =  readVoltage(a,'A13');
        degree_five = (voltage_five - 2.5)*270/(-5);
    end
    softstopit_elbow(a);
    
    voltage_six =  readVoltage(a,'A15');
    degree_six =  (voltage_six - 2.5)*270/(-5);
    while degree_six < 35
        clockwise_base(a);
        voltage_six =  readVoltage(a,'A15');
        degree_six = (voltage_six - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
    oppening_gripper(a);
    pause(0.3);
    softstopit_gripper(a);
    
    voltage_eight =  readVoltage(a,'A13');
    degree_eight =  (voltage_eight - 2.5)*270/(-5);
    while degree_eight > 0
        anticlockwise_elbow(a);
        voltage_eight =  readVoltage(a,'A13');
        degree_eight = (voltage_eight - 2.5)*270/(-5);
    end  
    softstopit_elbow(a);
    
    voltage_nine =  readVoltage(a,'A15');
    degree_nine =  (voltage_nine - 2.5)*270/(-5);
    while degree_nine > 0
        anticlockwise_base(a);
        voltage_nine =  readVoltage(a,'A15');
        degree_nine = (voltage_nine - 2.5)*270/(-5);
    end
    softstopit_base(a);
    
else
    disp('NO OBJECT FOUND');
end
clear cam;
