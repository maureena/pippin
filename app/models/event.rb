class Event < ActiveRecord::Base
  has_and_belongs_to_many :venues
  has_and_belongs_to_many :categories
end
