fmin = -1;
fmax = 1;
imax = 256;
imin = 0;
s = 500;

a = zeros(s,'uint8');


    for x = 1:s
       for y  = 1:s

           m = sqrt((x - s/2)^2 + (y  - s/2)^2);
           b = cos((m*2*pi + pi/4)/50) + sin((m*2*pi -pi/4)/50);
           tx = (b - fmin)/(fmax - fmin);
           v = tx*(imax - imin) + imin;
           v = uint8(v);
           a(x,y) = v;

       end

    end
 