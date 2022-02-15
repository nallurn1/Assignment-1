require 'csv'

# define a Students class to represent the three expected columns
class Students <

    # a Person has a first name, last name, and city
    Struct.new(:student_id, :college_year, :list_of_courses_taken, :semesters_left, :number_of_classes, :first, :second, :third)
  
    # a method to print out a csv record for the current Person.
    # note that you can easily re-arrange columns here, if desired.
    # also note that this method compensates for blank fields.
    def print_csv_record
      printf("\"%s\",", student_id)
      printf("\"%s\",", college_year)
      printf("\"%s\",", list_of_courses_taken)
      printf("\"%s\",", semesters_left)
      printf("\n")
    end

end
#--------------------FUNCTIONS-----------------------------------------------------------------#  
#----------sort by year-----------------#
def sort_by_year(students1, s1)
  students = Array.new
  max = 0
  students1.each do |a| a.semesters_left
    z = (a.semesters_left).to_i 
    puts a.semesters_left
    if z > max

      s1 = a
      max = z
      students.push(s1)
    end
    if z < max
      # print("Hi")
    end
  end
  return students
end
#--------------------FUNCTIONS END--------------------------------------------------------------#  


#-------------------------------Main-----------------------------#


# define an array to hold the CSV records
courses = Array.new
students1 = Array.new

puts "\nTCNJ's EasyEnroll Protype Software\n"

i = 0
j = 0

while i == 0 #getting user input for course contraints file
  puts "Please add in the course contraint file, must add full file name with .csv format:\n"
  file_courses = gets.chomp

  #if file exists, continue
  s = Students.new 
  if File.exist?(file_courses)
    n = CSV.read(file_courses).count 
    table = CSV.parse(File.read(file_courses), headers:true)
      for row in 0..(n-2) do
        students1.push(s)
        for col in 0..7 do
          if col == 0
            s.student_id = table[row][col]
          
          elsif col == 1
            s.college_year = table[row][col]

          elsif col == 2
            counter = (table[row][col]).count(',')
            s.list_of_courses_taken = counter+1

          elsif col == 3
            s.semesters_left = table[row][col]

          elsif col == 4
            s.number_of_classes = table[row][col]

          elsif col == 5
            s.first = table[row][col]

          elsif col == 6
            s.second = table[row][col]

          else
            s.third = table[row][col]
            s = Students.new 
          end
        end
        
      end
    i = 0
    break
  else #if file doesnt exist, loop back
      puts "\nFile name is incorrect or wrong file type!\n"
      puts "Please try again :)\n"
  end
end
# sort the data by the last_name field
#   arr.sort! { |a,b| a.last_name.downcase <=> b.last_name.downcase }

counter = 0
s1 = Students.new
# do a little work here to get rid of double-quotes and blanks

s3 = sort_by_year(students1, s1)
s3.each { |p|p.print_csv_record}

