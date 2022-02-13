#Important gen to read .csv files
require 'csv' 

puts "\n"
puts "TCNJ's EasyEnroll Protype Software"
puts "\n"

i = 0
while i == 0 #getting user input for course contraints file
    puts "Please add in the course contraint file, must add full file name with .csv format:\n"
    file_student_pref = gets.chomp

    #Creating seven arrays with each column header values 
    student_id = []
    college_year = []
    taken_courses = []
    semesters_left = []
    courses_desired = []
    first = []
    second = []
    third = []

    #if file exists, continue
    if File.exist?(file_student_pref)

        CSV.foreach(file_student_pref, headers: true, col_sep: ",") do |col_val|
        student_id << col_val[0]
        college_year << col_val[1]
        taken_courses << col_val[2]
        semesters_left << col_val[3]
        courses_desired << col_val[4]
        first << col_val[5]
        second << col_val[6]
        third << col_val[7]

        
          end
        i = 0
        break
    else #if file doesnt exist, loop back
        puts "\nFile name is incorrect or wrong file type!\n"
        puts "Please try again :)\n"
    end
end

# #Name the output file
# puts "Enter name for enrollment plan file, must have the .csv format: "
# enroll_plan = gets.chomp.to_s
#puts "Enter name for enrollment plan file, must have the .csv format: "
# enroll_report = gets.chomp.to_s