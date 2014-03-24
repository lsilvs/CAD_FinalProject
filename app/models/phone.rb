class Phone < ActiveRecord::Base
  belongs_to :user
  attr_accessible :credit, :number
end
