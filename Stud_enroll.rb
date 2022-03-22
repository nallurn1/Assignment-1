#---------------------
#  Module Stud_enroll: Has 1 functions 
#  1) def Stud_enroll.stud_classes(course, student, enroll, s_e)
#  Parameters: The objects of Course, Students, Enrollment & Stud_Enrollment Struct dataclass
#  Function's Propose: To fill in the values for the output file, Student Enrollment
#----------------

#------Start of Module Stud_enroll------------------------------------#
module Stud_enroll
  #s_e = Stud_Enrollment object
  def Stud_enroll.stud_classes(course, student, enroll, s_e)
    #Variables needed for the for loop and if statements
    s_len = student.length
    e_len = enroll.length
    counter = 0

    #Looping though the all the students and getting the id # from the Student attribute and setting it to s_e 1st attribute
    for i in 0..(s_len-1) 
      s_e[i].id = student[i].student_id
      z = (student[i].student_id).to_s

      #Getting the list of classes that each student is enrolled in and setting it to s_e 2nd attribute
      for j in 0..(e_len-1) 
        x = (enroll[j].ids).to_s
        y = (enroll[j].course_num).to_s
        if x.include?(z)
            s_e[i].enroll_classes = (s_e[i].enroll_classes).to_s + y + ','

            #How many classes did the student get in?
            counter = counter + 1
        end
      end
      #Once the students have been given their list of classes, printing out error messages about the student's enrollment
      #Logic for the error messages
      if (student[i].number_of_classes).to_i != (counter)
        if s_e[i].enroll_classes == " "
          s_e[i].reason = "Student could not be placed into any of their perfered CSC classes"
        elsif (student[i].number_of_classes).to_i > (counter)
          s_e[i].reason = "Student could not be incorrectly placed into to many CSC classes"
        elsif (student[i].number_of_classes).to_i < (counter)
          s_e[i].reason = "Student could not be placed into their desired number of CSC classes "
        end
      end

      #If there are not errors for the student's enrollment, printing out blank space
      if (student[i].number_of_classes).to_i == (counter)
        s_e[i].reason = ""
      end
      #If a student left the number of deisred of classes as 0, they will not be placed in any CS classes
      if (student[i].number_of_classes).to_i == 0 || (student[i].number_of_classes).to_i == 0 && counter == 1
        s_e[i].reason = "Did not desire to be put in any CS classes"
      end
    end
  end
end
#------End of Module Stud_enroll---------------------------------------#