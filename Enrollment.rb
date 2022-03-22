#Defining a Enrollment class to represent the six columns for the enroll.csv file, output file
class Enrollment <
    Struct.new(:course_num, :section_num, :ids, :num_seats_filled, :num_seats_open, :run)
end