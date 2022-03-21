#Defining a Course class to represent the four expected columns from the course_constraints file
class Course <
    Struct.new(:course_num, :num_sections, :min_seats, :max_seats)
  end
  