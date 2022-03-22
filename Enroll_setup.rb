#---------------------
#  Module Enroll_setup: Has 1 functions 
#  1) def Enroll_setup.enroll_set_up(c, e)
#  Parameters: The objects of Course, & Enrollment Struct dataclass
#  Function's Propose: Setting up the enrollment output file values with blanck, and 0 values 
#----------------

#------Start of Module Enroll_setup-------------------------#
module Enroll_setup
    def Enroll_setup.enroll_set_up(c, e)
      enroll = Array.new
      course_len = c.length-1
  
      for x in 0..(course_len)
        if (c[x].num_sections).to_i >= 0
          #For courses with "0" class sections: Assuming it is 1 section
          if (c[x].num_sections).to_i == 0
            e.course_num = c[x].course_num
            e.section_num = "0" + (1).to_s
            e.ids = " "
            e.num_seats_filled = 0
            e.num_seats_open = c[x].max_seats
            e.run = " "
            enroll.push(e)
            e = Enrollment.new 
          end
          #Classes with 1 to 4 class sections 
          for i in 0..((c[x].num_sections).to_i)-1
            e.course_num = c[x].course_num
            str = (i+1).to_s
            e.section_num = "0" + str
            e.num_seats_filled = 0
            e.num_seats_open = c[x].max_seats
            e.run = " "
            enroll.push(e)
            e = Enrollment.new 
            str = " "
          end
        end
      end
      return enroll
    end
  end
 #------End of Module Enroll_setup----------------------------#
  