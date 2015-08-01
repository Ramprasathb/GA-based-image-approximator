function [ childCandidate1, childCandidate2 ] = crossover ( m, n, candidate1, candidate2 )

  mn = m * n;
  string1 = reshape ( candidate1, 1, mn );
  string2 = reshape ( candidate2, 1, mn ); 
  i = randi ( [ 1, mn ], 1, 1 );
  string3 = [ string1(1:i), string2(i+1:mn) ];
  string4 = [ string2(1:i), string1(i+1:mn) ];
  childCandidate1 = reshape ( string3, m, n );
  childCandidate2 = reshape ( string4, m, n );
  return
end
