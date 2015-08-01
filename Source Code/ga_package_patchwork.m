image_name = '4.jpg';
image =  imread(image_name);
figure(1);
imshow(image_name); title('Input Image');
initial_population = 10;
image_array = zeros(56,32,initial_population);
for i = 1 : initial_population
  candidate(1:56,1:32,i) =  randi([ 0, 1 ], 56, 32 );
end
fitness_till_now = Inf;
generation = 0;
max_generation = 10000;

while(1)
    fitness = zeros(initial_population, 1);
     for temp = 1 : initial_population
      original_rgb = rgb_average(candidate(1:56,1:32,temp));
      fitness(temp) = calculate_fitness(image, original_rgb );
     end
    
    fitness_min = Inf;
    fitness_position = 0;
    for j = 1 : initial_population
      if ( fitness(j) < fitness_min )
        fitness_min = fitness(j);
        fitness_position = j;
      end
    end
 
    if ( fitness_min < fitness_till_now )
      fitness_till_now = fitness_min;
    end
    
    for j = 1 : initial_population - 1
      for k = j + 1 : initial_population
        if ( fitness(k) < fitness(j) )
          temp = fitness(k);
          fitness(k) = fitness(j);
          fitness(j) = temp;

          t = candidate(1:56,1:32,k);
          candidate(1:56,1:32,k) = candidate(1:56,1:32,j);
          candidate(1:56,1:32,j) = t;
        end
      end
    end    
    if ( generation == 0 )
      figure ( 2 );
      hold on
      axis ( [ 0, max_generation, 0, fitness_min ] )
      plot ( generation, fitness_min, 'b*' )
      grid on
      drawnow
    else
      figure ( 2 );
      plot ( generation, fitness_min, 'b*' )
      if ( generation == max_generation )
        hold off
      end
      drawnow
    end

    if ( generation == max_generation || mod ( generation, 1000 ) == 0 )
      figure (3);
      header = sprintf ( 'Genearation number %d', generation );
      original_rgb = rgb_average(candidate(1:56,1:32,1) );
      imshow(original_rgb);
      title (header);
    end

    if ( max_generation <= generation )
      break;
    end
   generation = generation + 1;

   position1 = randi ( [ 1, 8 ], 1, 1 );
   position2 = randi ( [ 1, 8 ], 1, 1 );

    if ( position1 == position2 )
      position1 = 1;
      position2 = randi ( [ 2, 8 ], 1, 1 );
    end
    
     [ candidate(1:56,1:32,9), candidate(1:56,1:32,10) ] = ...
      crossover(56, 32, candidate(1:56,1:32,position1), candidate(1:56,1:32,position2) );
      mutation_position = randi( [ 3, 8 ], 1, 1 );
     candidate(1:56,1:32,mutation_position) = mutation( 56, 32, candidate(1:56,1:32,mutation_position) );
end

