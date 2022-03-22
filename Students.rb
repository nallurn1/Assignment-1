#Defining a Students class to represent the seven expected columns from the student_prefs file
class Students <
    Struct.new(:student_id, :college_year, :list_of_courses_taken, :semesters_left, :number_of_classes, :first, :second, :third)  
end