#---------------------
#  Module Sorting_enroll: Has 1 function
#  1) def Sorting_enroll.sorting_stud(course, student, counter, enroll)
#  Parameters: The objects for Course, Students, & Enrollment Struct dataclass
#  Function's Propose: Sorting the student by their prefence to get enrolled into their needed CS classes, the result is the output for the Enroll output file
#----------------

#------Start of Module Sorting_enroll--------------------------------#
module Sorting_enroll
    def Sorting_enroll.sorting_stud(course, student, counter, enroll)
      #Other varibles needed for the for loops and if statements
      c_len = course.length - 1
      enroll_len = enroll.length - 1
      count = 0
      #Main for loop until the students are enrolled into all their needed classes
      #by their number of desired CS classes and the limit on only two CS classes per student 
      for x in 0..(c_len) do

        #The student's 1st preference being found here
        if ((course[x].course_num).to_s == student[counter][5] && student[counter].number_of_classes != 0)
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
              #If the student only needs to get into one class, and already got into their first pref
              if ((student[counter][4]).to_i == 0 || (student[counter][4]).to_i == 1 && student[counter].number_of_classes != 0)
                break 
              end
            end
          end
        end
        #The student's 2nd preference being found here: same logic as 1st preference
        if (course[x].course_num).to_s == student[counter][6]
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
        #The student's 3rd preference being found here: same logic as 1st preference
        if ((course[x].course_num).to_s == student[counter][7] && student[counter].number_of_classes != 0)
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