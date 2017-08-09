require 'rails_helper'

RSpec.describe Product, type: :model do

  # Validations
  it { validate_presence_of :name }
  it { validate_presence_of :price }
  it { validate_presence_of :brand }
  it { validate_numericality_of(:price).is_less_than_or_equal_to(100) }

  # Associations
  it { should belong_to(:brand) }
end
