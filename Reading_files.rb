require_relative "Students"
require_relative "Course"

module Reading_files

    def Reading_files.course_file(c, courses)
        #For the while loops to get values from the input files
        j = 0
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
    end

    def Reading_files.student_file(s, students1)
        #For the while loops to get values from the input files
        i = 0
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
    end
end