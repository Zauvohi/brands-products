require "rails_helper"

RSpec.describe Brand, :type => :model do
  it { validate_presence_of :name }
end
