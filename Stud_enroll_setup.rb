#---------------------
#  Module Stud_enroll_setup: Has 1 function
#  1) def Stud_enroll_setup.stud_set_up(s, s_e)
#    Parameters: The objects for Students, & Stud_Enrollment Struct dataclass
#    Function's Propose: It is used to set up the student enrollment file, one of the output files with blank spaces, and N/A
#----------------

#------Start of Module Stud_enroll_setup-----------------#
module Stud_enroll_setup
    def Stud_enroll_setup.stud_set_up(s, s_e)
      #Creating an array object to store the values of the attirbutes of the s_e (student enroll) object
      #will help with indexing when using the sorting the student enrollment output file 
      stud_enroll = Array.new
      stud_len = s.length-1
        #Sets up the structure of the student enrollment output file
        for x in 0..(stud_len)
          s_e.id = s[x].student_id
          s_e.enroll_classes = " "
          s_e.reason = "N/A"
          stud_enroll.push(s_e)
          s_e = Stud_Enrollment.new 
        end
      return stud_enroll
    end
end
#------End of Module Stud_enroll_setup-------------------#