#Defining a Students class to represent the seven expected columns from the student_prefs file
class Students <
    Struct.new(:student_id, :college_year, :list_of_courses_taken, :semesters_left, :number_of_classes, :first, :second, :third)  
    
    # for debugging created a print function 
    def print_csv_record
      printf("\"%s\",", student_id)
      printf("\"%s\",", college_year)
      printf("\"%s\",", list_of_courses_taken)
      printf("\"%s\",", semesters_left)
      printf("\"%s\",", first)
      printf("\"%s\",", second)
      printf("\"%s\",", third)
      printf("\n")
    end
end