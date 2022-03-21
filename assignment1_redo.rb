# Assignment 1: EasyEnroll Prototype Software
# Description: Project to sort students into classes for enrollment, based on inputed data via .csv files.
# Inputs: The course_contraints and student_prefs file
# Outputs: Creates a file for all the enrolls of students in classes and what classes each student got into

#--------Making the needed connections between all the files and this file (acting as main/driver of the program)--------------#
#All the modules 
require_relative "Sorting_input"
require_relative "Sorting_enroll"
require_relative "Enroll_setup"
require_relative "Stud_enroll_setup"
require_relative "Stud_enroll"
require_relative "Reading_files"
require_relative "Output_files"

#All the four classes
require_relative "Students"
require_relative "Course"
require_relative "Stud_Enrollment"
require_relative "Enrollment"

#For the modules 
include Sorting_input
include Sorting_enroll
include Enroll_setup
include Stud_enroll_setup
include Stud_enroll

#Importing the ruby gem for csv 
require 'csv'

#-------------------------------MAIN-------------------------------------------------------------------------------#
puts "\nTCNJ's EasyEnroll Protype Software\n"

#Define an array to read the input csv files
courses = Array.new
students1 = Array.new

#Defining objects from Course and Students classes
c = Course.new 
s = Students.new 

#Calling the reading in files functions, they are in the same module
Reading_files.course_file(c, courses) #for course input
Reading_files.student_file(s, students1) #for course input

#Sorting the student pref file, (this is being called in this order into to get the right results)
s3 = Sorting_input.sort_by_classes_done(students1)
s4 = Sorting_input.sort_num_prefs_3(s3)
s5 = Sorting_input.sort_by_year(s4)

#Debugging: checking the values in student_prefs file
s5.each{|s|s.print_csv_record}

#Setting up the Enrollment Struct class object
e = Enrollment.new 

#Passing the object to enroll_set_up in order to fill up first output
#The output file, enroll.csv, is being initialized
e1 = Enroll_setup.enroll_set_up(courses, e)

#Setting up the Stud_Enrollment Struct class dataclass
s_e = Stud_Enrollment.new 

#Passing the object to enroll_set_up in order to fill up first output
#The output file, enroll.csv, is being initialized
s_e1 = Stud_enroll_setup.stud_set_up(s5, s_e)

#Duplicating, .dup, the objects from all 4 classes for the sorting functions below
course = courses.dup
s6 = s5.dup
s7 = s5.dup
e2 = e1.dup

#Sorting the students into their needed CSC classes: for output file #1
counter = 0
while counter < (s6.length)
  Sorting_enroll.sorting_stud(course, s6, counter, e2)
  s6.delete_at counter
end

#Sorting the students on what CSC classes they got into: for output file #2
Stud_enroll.stud_classes(course, s7, e1, s_e1)

#Asking user for the name of enrollment output file
puts "Enter name for enrollment output file (including .csv): " 
enrollfile = gets.chomp.to_s

#Asking user for the name of student enrollment output file
puts "Enter name for student output file (including .csv): "
studentfile = gets.chomp.to_s

#Calling the creating output file functions, they are in the same module
Output_files.creating_output1(enrollfile, e2) #for enrollment output .csv file 
Output_files.creating_output2(studentfile, s_e1) #for student enrollment output .csv file 
#-------------------------------END--------------------------------------------------------------------------------#