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
        # if (student[counter].number_of_classes == 0)
        #   return 0
        #The student's 1st preference being found here
        if ((course[x][0]).to_s == student[counter][5] && student[counter].number_of_classes != 0)
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
              if ((student[counter][4]).to_i == 0 || (student[counter][4]).to_i == 1 && student[counter].number_of_classes != 0)
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
        if ((course[x][0]).to_s == student[counter][7] && student[counter].number_of_classes != 0)
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