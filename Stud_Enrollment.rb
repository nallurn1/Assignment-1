#Defining a Enrollment class to represent the three columns for the stud_classes.csv file, output file
class Stud_Enrollment <
    Struct.new(:id, :enroll_classes, :reason)
  end