require 'csv'

# define a Students class to represent the 7 expected columns
class Students <
    Struct.new(:student_id, :college_year, :list_of_courses_taken, :semesters_left, :number_of_classes, :first, :second, :third)
  
    def print_csv_record
      printf("\"%s\",", student_id)
      printf("\"%s\",", college_year)
      # printf("\"%s\",", list_of_courses_taken)
      # printf("\"%s\",", semesters_left)
      printf("\"%s\",", first)
      printf("\"%s\",", second)
      printf("\"%s\",", third)
      printf("\n")
    end
end

# define a Students class to represent the three expected columns
class Course <
  Struct.new(:course_num, :num_sections, :min_seats, :max_seats)

  def print_csv_record
    printf("\"%s\",", course_num)
    printf("\"%s\",", num_sections)
    printf("\"%s\",", min_seats)
    printf("\"%s\",", max_seats)
    printf("\n")
  end
end

# define a Enrollment class to represent the six expected columns
class Enrollment <
  Struct.new(:course_num, :section_num, :ids, :num_seats_filled, :num_seats_open, :run)
  def print_csv_record
    printf("\"%s\",", course_num)
    printf("\"%s\",", section_num)
    printf("\"%s\",", ids)
    printf("\"%s\",", num_seats_filled)
    printf("\"%s\",", num_seats_open)
    printf("\"%s\",", run)
    printf("\n")
  end
end

# define a Student Enrollment to represent the six expected columns
class Stud_Enrollment <
  Struct.new(:id, :enroll_classes, :reason)
  def print_csv_record
    printf("\"%s\",", id)
    printf("\"%s\",", enroll_classes)
    printf("\"%s\",", reason)
    printf("\n")
  end
end

#--------------------FUNCTIONS-----------------------------------------------------------------#  
#----------sorting student pref file-----------------#
module Sorting_input
  def Sorting_input.sort_by_year(students)
    stud = students.dup
    stud_len = stud.length-1
    return stud if stud_len < 0

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

  def Sorting_input.sort_by_classes_done(students)
    stud = students.dup
    stud_len = stud.length-1
    return stud if stud_len < 0

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

  def Sorting_input.sort_num_prefs_3(students)
    stud = students.dup
    stud_len = stud.length-1
    return stud if stud_len < 0

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
#----------sorting student pref file-----------------#

#------Sorting students into their classes-----------#
module Sorting_stud_enroll
  def Sorting_stud_enroll.sorting_stud(course, student, counter, enroll)
    c_len = course.length - 1
    enroll_len = enroll.length - 1

    count = 0
    for x in 0..(c_len) do
      # 1st pref
      if (course[x][0]).to_s == student[counter][5]
        for j in 0..(enroll_len) do
          if enroll[j][0] == student[counter][5]
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
          #if they only need to get into one class
          if (student[counter][4]).to_i == 0 || (student[counter][4]).to_i == 1
            break 
          end
        end
      end
      # 2st pref
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
        end
      end
      # # 2st pref
      # if (course[x][0]).to_s == student[counter][6]
      #   print("  ")
      #   for j in 0..(enroll_len) do
      #     if enroll[j][0] == student[counter][6]
      #       if (enroll[j][3]).to_i < (course[x][3]).to_i && (enroll[j][4]).to_i >= 0
      #         count = count + 1
      #         enroll[j][2] = (enroll[j][2]).to_s + (student[counter][0]).to_s + ","
      #         enroll[j][3] = count + (enroll[j][3])
      #         enroll[j][4] = (enroll[j][4]).to_i - count 
      #         if (enroll[j][3]).to_i < (course[x][2]).to_i
      #           enroll[j][5] = "No"
      #         else 
      #           enroll[j][5] = "Yes" 
      #         end
      #         count = 0
      #         break
      #       end
      #     end
      #     if (enroll[j][4]).to_i > (course[x][2]).to_i
      #       enroll[j][5] = "No" 
      #     end
      #   end
      #   break
      # end
    end
  end
end
#------End students into their classes-----------#

#------Setting the Struct Enroll-----------------#
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


#-------------------------------Main------------------------------------------------------------#
puts "\nTCNJ's EasyEnroll Protype Software\n"

j = 0
i = 0

# define an array to hold the CSV records
courses = Array.new
students1 = Array.new

#Defining objects
c = Course.new 
s = Students.new 

while j == 0 #getting user input for course contraints file
  puts "Please add in the course contraint file, must add full file name with .csv format:\n"
  file_courses = gets.chomp

  #if file exists, continue
  if File.exist?(file_courses)
    n = CSV.read(file_courses).count 
    table = CSV.parse(File.read(file_courses), headers:true)
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
  else #if file doesnt exist, loop back
      puts "\nFile name is incorrect or wrong file type!\n"
      puts "Please try again :)\n"
  end
end

while i == 0 #getting user input for course contraints file
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
            # str = remove_copys(table[row][col])
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

          elsif col == 7
            s.third = table[row][col]

          else
            students1.push(s)
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

#Sorting the student pref file
s3 = Sorting_input.sort_by_classes_done(students1)
s4 = Sorting_input.sort_num_prefs_3(s3)
s5 = Sorting_input.sort_by_year(s4)
# s5.each{|s|s.print_csv_record}

#Checking the values in course_constraint file
# courses.each{|c|c.print_csv_record}

#Setting up the Enrollment Struct
e = Enrollment.new 
e1 = Enroll_setup.enroll_set_up(courses, e)

#Setting up the Enrollment Struct
s_e = Stud_Enrollment.new 
s_e1 = Stud_enroll_setup.stud_set_up(s5, s_e)

#Calling the function to sort students into classes
course = courses.dup
s6 = s5.dup
e2 = e1.dup
counter = 0
while counter < (s6.length)
  Sorting_stud_enroll.sorting_stud(course, s6, counter, e2)
  s6.delete_at counter
end
e2.each{|e|e.print_csv_record}

#input for enrollment output file name
puts "Enter name for enrollment output file (including .csv): " 
enrollfile = gets.chomp.to_s

#input for student output file name
puts "Enter name for student output file (including .csv): "
studentfile = gets.chomp.to_s

CSV.open(enrollfile, 'w', :write_headers=> true, :headers => ["Course Num","Sections","Student IDs", "Seats Filled", "Seats Open", "Can Class Run?"]) do |write|
  e2.each{|c| write << c}
end

CSV.open(studentfile, 'w', :write_headers=> true, :headers => ["Student IDs","Classes Enrolled Into", "Reason"]) do |write|
  s_e1.each{|c| write << c}
end
