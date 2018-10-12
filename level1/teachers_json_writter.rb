  require 'json'

  filepath = '../data.json'
  serialized_data = File.read(filepath)
  data = JSON.parse(serialized_data)

  def auto_increment_teacher_id(teacher_array)
    id_array = []
    teacher_array.each { |teacher| id_array << teacher["id"] }
    id_array.empty? ? auto_increment_teacher_id = 1 : auto_increment_teacher_id = id_array.max + 1
  end

  auto_incremented_id = auto_increment_teacher_id(data["teachers"])

  skills_hash = {}
  skills_array = []

  #view
  p "- - - Welcome on Mymentor.com ! - - -"
  p "Hello dear new professor"
  p "what's your first name ?"
  print ">"
  firstname = gets.chomp.capitalize

  p "what's your last name ?"
  print ">"
  lastname = gets.chomp.capitalize

  choice = "y"
  until choice == "n"
    p "what kind of fields do you teach ?(please write the number associated to your field)"
    p "."
    p "1 - mathematics"
    p "2 - english"
    p "3 - history"
    p "4 - biology"
    p "5 - physics"
    p "."
    print ">"
    fields = gets.chomp.to_i

    p "what is your level of teaching for this field ?(please write the number associated to your field)"
    p "."
    p "1 - grade 6th or cycle middle"
    p "2 - 7th, --> cycle middle"
    p "3 - 8th, --> cycle middle"
    p "4 - 9th, --> cycle high"
    p "5 - 10th, --> cycle high"
    p "6 - 11th, --> cycle high"
    p "7 - 12th, --> cycle high"
    p "."
    print ">"
    levels = gets.chomp.to_i
      skills_array << skills_hash = {
        "fields": fields,
        "levels": levels
        }

    p  'Do you want to add another field ? (y/n)'
    choice = gets.chomp
  end

  p "Thanks your #{firstname} #{lastname}, your profil registered successfully !"
  p "Goodbye !"

  new_teacher = {
      "id" => auto_incremented_id,
      "firstname" => firstname ,
      "lastname" => lastname,
      "skills" => skills_array
    }

    data["teachers"] << new_teacher

  File.open(filepath, 'w') do |file|
    file.write(JSON.generate(data))
  end
