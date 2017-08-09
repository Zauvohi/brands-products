require "rails_helper"

RSpec.describe Brand, :type => :model do

  # Validations
  it { validate_presence_of :name }
  it { validate_uniqueness_of :name }

  # Associations
  it { should have_many(:products) }
end
