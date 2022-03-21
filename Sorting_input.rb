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
    def sort_by_classes_done(stud)
      stud_len = stud.length-1
      return stud if stud_len < 0

      #Bubble sort logic
      loop do
        swapped = false
        (stud.length-1).times do |i|
          if stud[i].list_of_courses_taken < stud[i+1].list_of_courses_taken
            stud[i], stud[i+1] = stud[i+1], stud[i]
            swapped = true
          end
        end
        break if not swapped
      end
      return stud
    end

  #Using the bubble sort algorthim to sort the inputs from student_prefs file by completed classes
  def sort_num_prefs_3(stud)
    stud_len = stud.length-1
    return stud if stud_len < 0

    #Bubble sort logic
    loop do
      swapped = false
      (stud.length-1).times do |i|
        if ((stud[i].first).to_s != "N/A" && (stud[i].second).to_s != "N/A" &&  (stud[i].third != "N/A").to_s) 
          c1 = 1
          print((stud[i].first).to_s)
          print("    ") 
        else
          c1 = 0
        end
        if ((stud[i+1].first).to_s != "N/A" && (stud[i+1].second).to_s != "N/A" &&  (stud[i+1].third != "N/A").to_s) 
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

  #Using the bubble sort algorthim to sort the inputs from student_prefs file by year
  #Sorting for semester to be this task
  def sort_by_year(stud)
    #Duplicating object, to keep the orginal
    # stud = stud1.dup
    stud_len = stud.length-1
    return stud if stud_len < 0

    #Bubble sort logic
    loop do
      swapped = false
      (stud.length-1).times do |i|
        if stud[i].semesters_left > stud[i+1].semesters_left
          stud[i], stud[i+1] = stud[i+1], stud[i]
          swapped = true
        end
      end
      break if not swapped
    end
    return stud
  end
end
#----------End of Sorting student_pref file Module----------------------#
