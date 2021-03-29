class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  #accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.post_categories.build(category: category)
    end
    # we are only creating a new categor if it does not already exist with the current name. 
    # we call self.categories which reurns an array of Category objects.
    
  end

end
