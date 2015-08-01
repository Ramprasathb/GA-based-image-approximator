function original_rgb = rgb_average(candidate)
  c = zeros (256, 256);
  original_rgb = zeros ( 256, 256, 3 );
  for j = 1 : 32
    xl = btoi ( candidate(1:8,j) );
    yl = btoi ( candidate(9:16,j) );
    xr = btoi ( candidate(17:24,j) );
    yr = btoi ( candidate(25:32,j) );
     r = btoi ( candidate(33:40,j) );
     g = btoi ( candidate(41:48,j) );
     b = btoi ( candidate(49:56,j) );

    xlow = min ( xl, xr ) + 1;
    xhigh = max ( xl, xr ) + 1;
    ylow = min ( yl, yr ) + 1;
    yhigh = max ( yl, yr ) + 1;

    c(xlow:xhigh,ylow:yhigh) = c(xlow:xhigh,ylow:yhigh) + 1;

    original_rgb(xlow:xhigh,ylow:yhigh,1) = original_rgb(xlow:xhigh,ylow:yhigh,1) + r;
    original_rgb(xlow:xhigh,ylow:yhigh,2) = original_rgb(xlow:xhigh,ylow:yhigh,2) + g;
    original_rgb(xlow:xhigh,ylow:yhigh,3) = original_rgb(xlow:xhigh,ylow:yhigh,3) + b;

  end

  original_rgb(1:256,1:256,1) = original_rgb(1:256,1:256,1) ./ c(1:256,1:256);
  original_rgb(1:256,1:256,2) = original_rgb(1:256,1:256,2) ./ c(1:256,1:256);
  original_rgb(1:256,1:256,3) = original_rgb(1:256,1:256,3) ./ c(1:256,1:256);
  original_rgb = uint8(original_rgb);
  return
end