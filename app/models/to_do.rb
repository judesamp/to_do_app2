class ToDo < ActiveRecord::Base

 		scope :incomplete, -> { where(completed: false)} 
 		scope :completed, -> { where(completed: true)}

end
