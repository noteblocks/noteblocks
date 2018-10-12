require 'rails_helper'

RSpec.describe Notebook, type: :model do
  # Association test
  it { should have_many(:blocks).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:name) }
end
