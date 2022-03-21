#---------------------
#  Module Stud_enroll_setup: Has 1 function
#  1) def Stud_enroll_setup.stud_set_up(s, s_e)
#    Parameters:
#    The parameters for this functions are the objects (for Students, & Stud_Enrollment Struct dataclass)
#----------------

#------Start of Module Stud_enroll_setup-----------------#
module Stud_enroll_setup
    def Stud_enroll_setup.stud_set_up(s, s_e)
      stud_enroll = Array.new
      stud_len = s.length-1
        #Classes with 1 to 4 class sections 
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