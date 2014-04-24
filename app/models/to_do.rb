class ToDo < ActiveRecord::Base
  belongs_to :assignee

 	scope :incomplete, -> { where(completed: false)} 
 	scope :completed, -> { where(completed: true)}

  def self.search(search)
    type = search[:type]
    term = search[:term]

    case type
    when "1"
      ToDo.joins(:assignee).where("name LIKE ?", term)
    when "2"
      puts "2"
    when "3"
      puts "3"
    when "4"
      puts "4"
    when "5"
      puts "5"
    else
      puts "6"
    end

    # if type == "Completed"
    #   ToDo.where(:completed => term)
    # else
    #   
    # else
    #   ToDo.where("date = ?", term)
    # end
  end
end
