require 'json'

filepath = '../data.json'
serialized_data = File.read(filepath)
data = JSON.parse(serialized_data)


p "- - - Welcome on Mymentor.com ! - - -"
p "Hello dear new student"
p "What's your full name ?"

print ">"
fullname = gets.chomp.capitalize

p "what kinf of fields do you want to learn ?(please write the number associated to your field)"
p "."
p "1 - mathematics"
p "2 - english"
p "3 - history"
p "4 - biology"
p "5 - physics"
p "."
print ">"
fields = gets.chomp.to_i

p "what is your level in this field ?"
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

p "thanks for this informations"
sleep(1)
p "we are searching the best professor for you"
sleep(2)
p "just 3 more seconds"
sleep(1)
p "3"
sleep(1)
p "2"
sleep(1)
p "1"
sleep(1)
p "Tada ! 🎉  we have found the best teacher for you"

all_teachers = data["teachers"]
student_teacher_list = []
choice_array = []

all_teachers.each do |teacher_hash|
  teacher_hash["skills"].each do |skill|
    skill["fields"]
    skill["levels"]
    if skill["fields"] == fields && skill["levels"] == levels
     student_teacher_list << teacher_hash
    else
    end
  end
end
p "This is the list of professor you match with :"
student_teacher_list.each do |list|
  p "#{list['id']} - #{list['firstname']} #{list['lastname']}"
end
p "wich one is your favorite ? (please write the number associated to your field) "
print ">"
choice_teacher = gets.chomp.to_i - 1
student_teacher_list.each_with_index do |twin, index|
  if index == choice_teacher
    choice_array << twin
  else
  end
end
p "thank you for your choice"

new_request = {
    "fullname" => fullname ,
    "fields" => fields,
    "levels" => levels,
    "reference" => choice_array
  }

  data["requests"] << new_request
File.open(filepath, 'w') do |file|
  file.write(JSON.generate(data))
end
