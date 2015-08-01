function score = calculate_fitness (a, b )
  score = sum ( sum ( sum ( abs ( double ( a ) - double ( b ) ) ) ) );
  return
end
