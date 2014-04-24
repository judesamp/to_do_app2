class Assignee < ActiveRecord::Base
  has_many :to_dos
end
