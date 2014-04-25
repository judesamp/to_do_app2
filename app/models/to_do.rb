class ToDo < ActiveRecord::Base
  belongs_to :assignee


 	scope :incomplete, -> { where(completed: false)} 
 	scope :completed, -> { where(completed: true)}
  scope :yesterday, -> { where(completed: true)}
  # scope :today, -> { where(completed: true)}
  # scope :this_week, -> { where(completed: true)}
  # scope :this_month, -> { where(completed: true)}

  def self.search(search)
    type = search[:type]
    term = search[:term]
    scopey = search[:completed]

    search = ToDo.all


    if scopey == "yes"
      search = ToDo.completed
    elsif scopey == "all"
      search = ToDo.all
    else
      search = ToDo.incomplete
    end

    case type
    when "1"
      search = search.joins(:assignee).where("name LIKE ?", "%#{term}%")
    when "2"
      search = search.where(due_date: (DateTime.now.beginning_of_day - 1.day)..DateTime.now.beginning_of_day)
    when "3"
      search = search.where(due_date: (DateTime.now - 1.day..(DateTime.now)))
    when "4"
      search = search.where(due_date: (DateTime.now - 1.day..(DateTime.now + 6.days)))
    else
      search = search.joins(:assignee).where("name LIKE ?", "%#{term}%")
      search = search.where(due_date: (DateTime.now - 1.day..(DateTime.now + 30.days)))
    end

    unless type == "1"
      search = search.find(:all, :conditions => ["task LIKE ? OR description LIKE ? OR due_date LIKE ?", "%#{term}%", "%#{term}%", "%#{term}%"])
    end
  
    search

  end
end
