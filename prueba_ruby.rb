# scores_file abre el archivo .csv con alumnos y sus notas:
def scores_file(filename)
  file = File.open(filename, 'r')
  data = file.readlines.map { |linea| linea.chomp.split(', ') }
  file.close
  data
end
# el método scores_file devuelve un arreglo de arreglos con cada alumno y sus notas
# como arreglos individuales, y a continuación dicho retorno queda almacenado en la
# variable notas para poder ser llamado desde el main:
a = scores_file 'alumnos.csv'

# averages entrega el promedio de cada alumno:
def averages(alumnos)
  prom = alumnos.map do |notas|
    l = notas.map{|n| n.to_i}.sum / ( notas.length - 1 )
    [notas[0], l]
  end
  # generar archivo con promedios
  file = File.open('promedios.txt', 'w')
  file.print prom
  file.close
end
# b = averages(a) # almaceno los promedios en b
# print b

def inasistencias(asist)
  asist.map do |linea|
    cuenta_a = linea.select { |ele| ele == 'A' }.count
    [linea.first, cuenta_a] # retorno la estructura nombre y cuenta de inasistencias
  end
end
# print "\n \n"
# print inasistencias(a)

def aprobados(estudiantes, nota_nec = 5.0)
  x = averages(estudiantes)
  x.map { |e| [e.first, (e.last >= nota_nec)? 'aprobado' : 'reprobado']} # devuelvo arreglo con estructura nombre y aprobado o reprobado
end

# print aprobados(a, 5)

'alumnos.csv'


70.times { print '*' }
puts "\n"
puts '           -------------  MENU INFO ALUMNOS  ---------------'
70.times { print '*' }
puts "\n"
puts "\n"
choice = 0
while choice != 4
  puts 'Bienvenido! Lea cuidadosamente cada una de las siguientes opciones'
  puts "\n"
  puts '1) Alumnos y Promedios de Notas'
  puts '2) Inasistencias Totales'
  puts '3) Alumnos Aprobados'
  puts '4) Salir del Programa'

  puts 'Ingrese su opción: '
  choice = gets.chomp.to_i

  case choice
  when 1
    averages(a)
    puts 'Se ha creado el archivo promedios.txt'
    puts "\n \n \n"
  when 2
    print inasistencias(a)
    puts "\n \n \n"
  when 3
    print aprobados(a)
    puts "\n \n \n"
  end
  puts '¡Ingrese una opción válida (entre 1 y 4)!' if choice < 1 || choice > 4
  puts "\n \n \n"
end
