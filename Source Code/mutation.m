function candidate = mutation ( m, n, candidate )
  position2 = randi ( [ 1, n ], 1, 1 );
  position1 = randi ( [ 1, m ], 1, 1 );
  candidate(position1,position2) = 1 - candidate(position1,position2); 
  return
end

