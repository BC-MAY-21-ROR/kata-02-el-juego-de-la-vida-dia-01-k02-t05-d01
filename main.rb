# Solicitar medidas de la matriz al usuario
puts('Ancho de la matriz: ')
ancho = gets.chomp.to_i
puts('Largo de la matriz: ')
largo = gets.chomp.to_i

# Crear el largo de la matriz
grid = []
largo.times do |_i|
  grid.push([])
end

# Rellena la matriz aleatoriamente con celular vivas o muertas
grid.each do |i|
  ancho.times do |_x|
    random = rand(2)

    if random == 0
      i.push('.')
    else
      i.push('*')
    end
  end
end

# eliminar vida en los bordes
(0..largo - 1).each do |i|
  (0..ancho - 1).each do |x|
    grid[i][x] = '.' if (i == 0) || (i == largo - 1) || (x == 0) || (x == ancho - 1)
  end
end

puts '1era generacion'
# ver matriz primer generacion
(0..largo - 1).each do |i|
  cadena = ''
  (0..ancho - 1).each do |x|
    cadena += grid[i][x]
  end
  puts cadena
end

# Solo saltos linea
puts ' '
puts ' '

# Cilo para definir que celular viven o mueren
(1..largo - 2).each do |i|
  cadena = ''

  (1..ancho - 2).each do |x|
    # Contar celulas vivas alrededor de cada punto
    celulas_vivas1 = 0
    celulas_vivas1 += 1 if grid[i - 1][x - 1] == '*'
    celulas_vivas1 += 1 if grid[i - 1][x] == '*'
    celulas_vivas1 += 1 if grid[i - 1][x + 1] == '*'
    celulas_vivas1 += 1 if grid[i][x - 1] == '*'
    celulas_vivas1 += 1 if grid[i][x + 1] == '*'
    celulas_vivas1 += 1 if grid[i + 1][x - 1] == '*'
    celulas_vivas1 += 1 if grid[i + 1][x] == '*'
    celulas_vivas1 += 1 if grid[i + 1][x + 1] == '*'
    # Condiciones
    # celula viva con mas de 3 vecinos vivos muere
    grid[i][x] = '.' if celulas_vivas1 > 3 && grid[i][x] == '*'

    # celula viva con menor de dos vecinos vivos muere
    grid[i][x] = '.' if celulas_vivas1 < 2 && grid[i][x] == '*'

    # celula muerta con 3 vecinos vivos  revive
    grid[i][x] = '*' if celulas_vivas1 == 3 && grid[i][x] == '.'

    cadena += grid[i][x]
  end
end

# Mostrar la nueva generación en el grid
puts
puts 'Segunda generacion'
(0..largo - 1).each do |i|
  cadena = ''
  (0..ancho - 1).each do |x|
    cadena += grid[i][x]
  end
  puts cadena
end
