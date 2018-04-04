require 'json'

filepath = '../data.json'
serialized_data = File.read(filepath)
data = JSON.parse(serialized_data)

def auto_increment_teacher_id(teacher_array)
  id_array = []
  teacher_array.each do |teacher|
    id_array << teacher["id"]
  end
  id_array.empty? ? auto_increment_teacher_id = 1 : auto_increment_teacher_id = id_array.max + 1
end

auto_incremented_id = auto_increment_teacher_id(data["teachers"])

new_teacher = {
    "id" => auto_incremented_id,
    "firstname" =>  'Albert',
    "lastname" => 'Einstein',
    "fields" =>  1,
    "levels" => 7
  }

  data["teachers"] << new_teacher

File.open(filepath, 'w') do |file|
  file.write(JSON.generate(data))
end
