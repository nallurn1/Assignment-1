# Assignment 1: EasyEnroll Prototype Software
# Description: Project to sort students into classes for enrollment, based on inputed data via .csv files. Data includes ids, courses, choices, prereqs, etc.
# Inputs: The course_contraints and student_prefs file
# Outputs: Creates a file for all the enrolls of students in classes and what classes each student got into

#Importing the ruby gem for csv  
require 'csv'
#--------------------------------------Defining the four classes---------------------------------------------------# 
#Defining a Students class to represent the seven expected columns from the student_prefs file
class Students <
    Struct.new(:student_id, :college_year, :list_of_courses_taken, :semesters_left, :number_of_classes, :first, :second, :third)  
    
    #for debugging created a print function 
    # def print_csv_record
    #   printf("\"%s\",", student_id)
    #   printf("\"%s\",", college_year)
    #   printf("\"%s\",", list_of_courses_taken)
    #   printf("\"%s\",", semesters_left)
    #   printf("\"%s\",", first)
    #   printf("\"%s\",", second)
    #   printf("\"%s\",", third)
    #   printf("\n")
    # end
end

#Defining a Course class to represent the four expected columns from the course_constraints file
class Course <
  Struct.new(:course_num, :num_sections, :min_seats, :max_seats)

  #for debugging created a print function 
  # def print_csv_record
  #   printf("\"%s\",", course_num)
  #   printf("\"%s\",", num_sections)
  #   printf("\"%s\",", min_seats)
  #   printf("\"%s\",", max_seats)
  #   printf("\n")
  # end
end

#Defining a Enrollment class to represent the six columns for the enroll.csv file, output file
class Enrollment <
  Struct.new(:course_num, :section_num, :ids, :num_seats_filled, :num_seats_open, :run)

  #for debugging created a print function 
  # def print_csv_record
  #   printf("\"%s\",", course_num)
  #   printf("\"%s\",", section_num)
  #   printf("\"%s\",", ids)
  #   printf("\"%s\",", num_seats_filled)
  #   printf("\"%s\",", num_seats_open)
  #   printf("\"%s\",", run)
  #   printf("\n")
  # end
end

#Defining a Enrollment class to represent the three columns for the stud_classes.csv file, output file
class Stud_Enrollment <
  Struct.new(:id, :enroll_classes, :reason)
  
  #for debugging created a print function 
  # def print_csv_record
  #   printf("\"%s\",", id)
  #   printf("\"%s\",", enroll_classes)
  #   printf("\"%s\",", reason)
  #   printf("\n")
  # end
end

#---------------------------------------FUNCTIONS-----------------------------------------------------------------#  
#---------------------
#  Module Sorting_input: Has 3 functions 
#  1) def Sorting_input.sort_by_year(students)
#  2) Sorting_input.sort_by_classes_done
#  3) Sorting_input.sort_num_prefs_3
#    Parameters:
#    The parameter for this functions are the objects (for Students Struct dataclass)
#----------------
#----------Start of Sorting student_pref file Module-------------------#
module Sorting_input 
  #Using the bubble sort algorthim to sort the inputs from student_prefs file by year
  #Sorting for semester to be this task
  def Sorting_input.sort_by_year(students)
    #Duplicating object, to keep the orginal
    stud = students.dup
    stud_len = stud.length-1
    return stud if stud_len < 0

    #Bubble sort logic
    loop do
      swapped = false
      (stud.length-1).times do |i|
        if stud[i][3] > stud[i+1][3]
          stud[i], stud[i+1] = stud[i+1], stud[i]
          swapped = true
        end
      end
      break if not swapped
    end
    return stud
  end

  #Using the bubble sort algorthim to sort the inputs from student_prefs file by completed classes
  def Sorting_input.sort_by_classes_done(students)
    stud = students.dup
    stud_len = stud.length-1
    return stud if stud_len < 0

    #Bubble sort logic
    loop do
      swapped = false
      (stud.length-1).times do |i|
        if stud[i][2] < stud[i+1][2]
          stud[i], stud[i+1] = stud[i+1], stud[i]
          swapped = true
        end
      end
      break if not swapped
    end
    return stud
  end 

  #Using the bubble sort algorthim to sort the inputs from student_prefs file by completed classes
  def Sorting_input.sort_num_prefs_3(students)
    stud = students.dup
    stud_len = stud.length-1
    return stud if stud_len < 0

    #Bubble sort logic
    loop do
      swapped = false
      (stud.length-1).times do |i|
        if (stud[i][5] != 'N/A' && stud[i][6] != 'N/A' &&  stud[i][7] != 'N/A')
          c1 = 1
        else
          c1 = 0
        end
        if (stud[i+1][5] != 'N/A' && stud[i+1][6] != 'N/A' &&  stud[i+1][7] != 'N/A')
          c2 = 1
        else
          c2 = 0
        end
        if (c1 < c2)
          stud[i], stud[i+1] = stud[i+1], stud[i]
          swapped = true
        end
      end
      break if not swapped
    end
    return stud
  end 

end
#----------End of Sorting student_pref file Module-------------------#

#---------------------
#  Module Sorting_enroll: Has 1 functions 
#  1) def Sorting_enroll.sorting_stud(course, student, counter, enroll)
#    Parameters:
#    The parameters for this functions are the objects (for Course, Students, & Enrollment Struct dataclass)
#----------------
#------Start of Module Sorting_enroll--------------------------------#
module Sorting_enroll
  #The counter paramter is used so that the function is being repeated over and over until all students are enrolled
  def Sorting_enroll.sorting_stud(course, student, counter, enroll)
    #Other varibles needed for the for loops and if statements
    c_len = course.length - 1
    enroll_len = enroll.length - 1
    count = 0
    
    #main for loop
    for x in 0..(c_len) do
      #The student's 1st preference being found here
      if (course[x][0]).to_s == student[counter][5]
        for j in 0..(enroll_len) do
          if enroll[j][0] == student[counter][5]

            #Logic for if the class sections can be filled up or not based on reading in the Course and student attributes
            if (enroll[j][3]).to_i < (course[x][3]).to_i && (enroll[j][4]).to_i >= 0
              count = count + 1
              enroll[j][2] = (enroll[j][2]).to_s + (student[counter][0]).to_s + ","
              enroll[j][3] = count + (enroll[j][3])
              enroll[j][4] = (enroll[j][4]).to_i - count 
              if (enroll[j][3]).to_i < (course[x][2]).to_i
                enroll[j][5] = "No"
              else 
                enroll[j][5] = "Yes" 
              end
              count = 0
              break
            end
            #If the class section can not be filled up
            if (enroll[j][4]).to_i > (course[x][2]).to_i
              enroll[j][5] = "No" 
            end
            #If the student only need to get into one class, and already got into their first pref
            if (student[counter][4]).to_i == 0 || (student[counter][4]).to_i == 1
              break 
            end
          end
        end
      end
      #The student's 2nd preference being found here
      #Same logic as 1st preference
      if (course[x][0]).to_s == student[counter][6]
        for j in 0..(enroll_len) do
          if enroll[j][0] == student[counter][6]
            if (enroll[j][3]).to_i < (course[x][3]).to_i && (enroll[j][4]).to_i >= 0
              count = count + 1
              enroll[j][2] = (enroll[j][2]).to_s + (student[counter][0]).to_s + ","
              enroll[j][3] = count + (enroll[j][3])
              enroll[j][4] = (enroll[j][4]).to_i - count 
              if (enroll[j][3]).to_i < (course[x][2]).to_i
                enroll[j][5] = "No"
              else 
                enroll[j][5] = "Yes" 
              end
              count = 0
              break
            end
          end
          if (enroll[j][4]).to_i > (course[x][2]).to_i
            enroll[j][5] = "No" 
          end
          if (student[counter][4]).to_i == 0 || (student[counter][4]).to_i == 1
            break 
          end
        end
      end
      #The student's 3rd preference being found here
      #Same logic as 1st preference
      if (course[x][0]).to_s == student[counter][7]
        for j in 0..(enroll_len) do
          if enroll[j][0] == student[counter][7]
            if (enroll[j][3]).to_i < (course[x][3]).to_i && (enroll[j][4]).to_i >= 0
              count = count + 1
              enroll[j][2] = (enroll[j][2]).to_s + (student[counter][0]).to_s + ","
              enroll[j][3] = count + (enroll[j][3])
              enroll[j][4] = (enroll[j][4]).to_i - count 
              if (enroll[j][3]).to_i < (course[x][2]).to_i
                enroll[j][5] = "No"
              else 
                enroll[j][5] = "Yes" 
              end
              count = 0
              break
            end
          end
          if (enroll[j][4]).to_i > (course[x][2]).to_i
            enroll[j][5] = "No" 
          end
          if (student[counter][4]).to_i == 0 || (student[counter][4]).to_i == 1
            break 
          end
        end
      end
    end
  end
end
#------End of Module Sorting_enroll-----------------------------------#

#---------------------
#  Module Stud_enroll: Has 1 functions 
#  1) def Stud_enroll.stud_classes(course, student, enroll, s_e)
#    Parameters:
#    The parameters for this functions are the objects (for Course, Students, Enrollment & Stud_Enrollment Struct dataclass)
#----------------
#------Start of Module Stud_enroll------------------------------------#
module Stud_enroll
  #s_e = Stud_Enrollment object
  def Stud_enroll.stud_classes(course, student, enroll, s_e)
    #Varibles needed for the for loop and if statements
    s_len = student.length
    e_len = enroll.length
    counter = 0

    #Looping though the all the students and getting the id # from the Student attribute and setting it to s_e 1st attribute
    for i in 0..(s_len-1) 
      s_e[i][0] = student[i][0] 
      z = (student[i][0]).to_s

      #Getting the list of classes that each student is enrolled in and setting it to s_e 2nd attribute
      for j in 0..(e_len-1) 
        x = (enroll[j][2]).to_s
        y = (enroll[j][0]).to_s
        if x.include?(z)
            s_e[i][1] = (s_e[i][1]).to_s + y + ','
            counter = counter + 1
        end
      end
      #Once the students have been given their list of classes, printing out error messages about the student's enrollment
      #Logic for error messages
      if (student[i][4]).to_i != (counter)
        if s_e[i][1] == " "
          s_e[i][2] = "Student could not be placed into any of their perfered CSC classes"
        elsif (student[i][4]).to_i > (counter)
          s_e[i][2] = "Student could not be incorrectly placed into to many CSC classes"
        elsif (student[i][4]).to_i < (counter)
          s_e[i][2] = "Student could not be placed into their desired number of CSC classes "
        end
      end

      #If there are not errors for the student's enrollment, printing out blank space
      if (student[i][4]).to_i == (counter)
        s_e[i][2] = ""
      end
      if (student[i][4]).to_i == 0 || (student[i][4]).to_i == 0 && counter == 1
        s_e[i][2] = ""
      end
    end
  end
end
#------End of Module Stud_enroll---------------------------------------#


#---------------------
#  Module Stud_enroll: Has 1 functions 
#  1) def Enroll_setup.enroll_set_up(c, e)
#    Parameters:
#    The parameters for this functions are the objects (for Course, Students, Enrollment & Stud_Enrollment Struct dataclass)
#----------------
#------Setting the Struct Enroll---------------------------------------#
module Enroll_setup
  def Enroll_setup.enroll_set_up(c, e)
    enroll = Array.new
    course_len = c.length-1

    for x in 0..(course_len)
      if (c[x][1]).to_i >= 0
        #For courses with "0" class sections: Assuming it is 1 section
        if (c[x][1]).to_i == 0
          e.course_num = c[x][0]
          e.section_num = "0" + (1).to_s
          e.ids = " "
          e.num_seats_filled = 0
          e.num_seats_open = c[x][3]
          e.run = " "
          enroll.push(e)
          e = Enrollment.new 
        end
        #Classes with 1 to 4 class sections 
        for i in 0..((c[x][1]).to_i)-1
          e.course_num = c[x][0]
          str = (i+1).to_s
          e.section_num = "0" + str
          e.num_seats_filled = 0
          e.num_seats_open = c[x][3]
          e.run = " "
          enroll.push(e)
          e = Enrollment.new 
          str = " "
        end
      end
    end
    return enroll
  end
end
#------Setting Enroll Struct End------------------#


#------Setting Up Stud Enroll-----------------#
module Stud_enroll_setup
  def Stud_enroll_setup.stud_set_up(s, s_e)
    stud_enroll = Array.new
    stud_len = s.length-1
      #Classes with 1 to 4 class sections 
      for x in 0..(stud_len)
        s_e.id = s[x][0]
        s_e.enroll_classes = " "
        s_e.reason = "N/A"
        stud_enroll.push(s_e)
        s_e = Stud_Enrollment.new 
      end
    return stud_enroll
  end
end
#------End of Stud Enroll-----------------------#
#--------------------END OF MODULES--------------------------------------------------------------#  


#-------------------------------MAIN-------------------------------------------------------------------------------#
puts "\nTCNJ's EasyEnroll Protype Software\n"

#For the while loops to get values from the input files
j = 0
i = 0

#Define an array to read the input csv files
courses = Array.new
students1 = Array.new

#Defining objects
c = Course.new 
s = Students.new 

#Getting user input for course constraints file
while j == 0 
  puts "Please input the course contraint file, must add full file name with .csv format:\n"
  #Reading in user input
  file_courses = gets.chomp

  #If file exists, continue
  if File.exist?(file_courses)
    n = CSV.read(file_courses).count 
    table = CSV.parse(File.read(file_courses), headers:true)
      #Looping through the file input and setting to the correct attributes in the Course struct dataclass
      for row in 0..(n-2) do
        c = Course.new 
        for col in 0..4 do
          if col == 0
            c.course_num = table[row][col]
          
          elsif col == 1
            c.num_sections = table[row][col]

          elsif col == 2
            c.min_seats = table[row][col]

          elsif col == 3
            c.max_seats = table[row][col]

          else
            courses.push(c)
          end
        end
      end
    j = 0
    break
  #If file doesnt exist, go back to while loop
  else 
      puts "\nFile name is incorrect or wrong file type!\n"
      puts "Please try again :)\n"
  end
end

while i == 0 #getting user input for student pref file
  puts "Please add in the student preference, must add full file name with .csv format:\n"
  file_courses = gets.chomp

  #if file exists, continue
  if File.exist?(file_courses)
    n = CSV.read(file_courses).count 
    table = CSV.parse(File.read(file_courses), headers:true)
      for row in 0..(n-2) do
        s = Students.new 
        for col in 0..8 do
          if col == 0
            s.student_id = table[row][col]
          
          elsif col == 1
            s.college_year = table[row][col]

          elsif col == 2
            str = table[row][col]
            str1 = str.split(',').uniq
            s.list_of_courses_taken = str1.length

          elsif col == 3
            s.semesters_left = table[row][col]

          elsif col == 4
            s.number_of_classes = table[row][col]

          elsif col == 5
            s.first = table[row][col]

          elsif col == 6
            s.second = table[row][col]

          elsif col == 7
            s.third = table[row][col]

          else
            students1.push(s)
          end
        end
      end
    i = 0
    break
  #If file doesnt exist, go back to while loop
  else
      puts "\nFile name is incorrect or wrong file type!\n"
      puts "Please try again :)\n"
  end
end

#Sorting the student pref file, (this is being called in this order into to get the right results)
s3 = Sorting_input.sort_by_classes_done(students1)
s4 = Sorting_input.sort_num_prefs_3(s3)
s5 = Sorting_input.sort_by_year(s4)

#Debugging: checking the values in student_prefs file
# s5.each{|s|s.print_csv_record}

#Debugging: checking the values in course_constraint file
# courses.each{|c|c.print_csv_record}

#Setting up the Enrollment Struct object
e = Enrollment.new 
#Passing the object to enroll_set_up in order to fill up first output
#The output file, enroll.csv, is being initialized
e1 = Enroll_setup.enroll_set_up(courses, e)

#Setting up the Stud_Enrollment Struct dataclass
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

#Debugging: checking the values in Enrollment Struct dataclass
# e2.each{|e|e.print_csv_record}

#Sorting the students on what CSC classes they got into: for output file #2
Stud_enroll.stud_classes(course, s7, e1, s_e1)

#Asking user for the name of enrollment output file
puts "Enter name for enrollment output file (including .csv): " 
enrollfile = gets.chomp.to_s

#Asking user for the name of student enrollment output file
puts "Enter name for student output file (including .csv): "
studentfile = gets.chomp.to_s

#Writing the Enrollment attriubutes to output file #1, enrollfile
#Within CSV.open, I created the headers for this output file
CSV.open(enrollfile, 'w', :write_headers=> true, :headers => ["Course Num","Sections","Student IDs", "Seats Filled", "Seats Open", "Can Class Run?"]) do |write|
  e2.each{|c| write << c}
end

#Writing the Stud_Enrollment attriubutes to output file #2, studentfile
#Within CSV.open, I created the headers for this output file
CSV.open(studentfile, 'w', :write_headers=> true, :headers => ["Student IDs","Classes Enrolled Into", "Reason"]) do |write|
  s_e1.each{|c| write << c}
end
