grid = [
  ['*', '.', '.', '.', '.', '.', '.', '.'],
  ['.', '.', '.', '.', '*', '.', '.', '.'],
  ['.', '.', '.', '*', '*', '.', '.', '.'],
  ['.', '.', '.', '.', '.', '.', '.', '.']
]

puts '1era generacion'
# ver matriz primer generacion
(0..3).each do |i|
  cadena = ''
  (0..7).each do |x|
    cadena += grid[i][x]
  end
  puts cadena
end

# Solo saltos linea
puts ' '
puts ' '

# eliminar vida en los bordes
(0..3).each do |i|
  (0..7).each do |x|
    grid[i][x] = '.' if (i == 0) || (i == 3) || (x == 0) || (x == 7)
  end
end

# Cilo para definir que celular viven o mueren
(1..2).each do |i|
  cadena = ''

  (1..6).each do |x|
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
(0..3).each do |i|
  cadena = ''
  (0..7).each do |x|
    cadena += grid[i][x]
  end
  puts cadena
end
