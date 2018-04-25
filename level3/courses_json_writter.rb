require 'json'

filepath = '../data.json'
serialized_data = File.read(filepath)
data = JSON.parse(serialized_data)

  #Add a new cours
  p "- - - Welcome on Mymentor.com ! - - -"
  p "Hello dear new student"
  p "What's your full name ?"
  print ">"
  fullname = gets.chomp.capitalize

  skills_hash = {}
  skills_array = []
  total = []

  choice = "y"
  until choice == "n"
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

    p "How many time do you want to study this field ? (please write a number in hour)"
    print ">"
    lenght = gets.chomp.to_i

    p "Please add the date of your courses (DD/MM/YYYY)"
    print">"
    date = gets.chomp

    p "thanks for this informations"
    levels == 1 ? price = 29 : price = 36
    subtotal = lenght * price
    total << subtotal

    p "you have choose #{lenght} hour(s)"
    p "you are in #{levels + 5}th so the price for this level it is : #{price} €  / hour"
    p " the subtotal of your bill is #{subtotal} €"

    skills_array << skills_hash = {
        "fields": fields,
        "levels": levels,
        "lenght": lenght,
        "price": price,
        "date": date,
      }

    p  'Do you want to add another field ? (y/n)'
    choice = gets.chomp
  end

  #Compute the subtotal price for all the courses of a specific request
  sum = 0
  p "- - - SUMMARY - - -"
  p "so you have :  "
    total.each do |subt|
      p"- #{subt} €"
      sum += subt
    end
  p "the TOTAL of your bill is #{sum}€"
  p "- - - THANK YOU - - -"


  new_request = {
      "fullname" => fullname ,
      "skills" => skills_array,
      "bill" => sum
        }

  data["requests"] << new_request
File.open(filepath, 'w') do |file|
  file.write(JSON.generate(data))
end
