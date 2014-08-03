class Category < ActiveRecord::Base
  has_and_belongs_to_many :events
  belongs_to :parent, class_name: 'Category'
  has_many :subcategories, class_name: 'Category', foreign_key: :parent_id, :dependent => :destroy
end
