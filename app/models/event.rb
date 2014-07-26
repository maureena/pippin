class Event < ActiveRecord::Base
  belongs_to :parent, class_name: 'Event'
  has_many :events, foreign_key: :parent_id
  has_and_belongs_to_many :venues
  has_and_belongs_to_many :categories
end
