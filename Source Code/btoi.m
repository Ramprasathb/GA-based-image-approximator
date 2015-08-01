function value = btoi ( binary )
  value = 0;
  for i = 1 : 8
    value = 2 * value + binary(i);
  end
  return
end
