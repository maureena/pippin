class Category < ActiveRecord::Base
  has_and_belongs_to_many :events
  belongs_to :parent, class_name: 'Category'
  has_many :categories, foreign_key: :parent_id
end
