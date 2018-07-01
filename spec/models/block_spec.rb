require 'rails_helper'

RSpec.describe Block, type: :model do
  # Association test
  it { should belong_to(:notebook) }

  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:schema_version) }
  it { should validate_presence_of(:data) }

  it { should validate_inclusion_of(:schema_version).in_array(['v1']) }
end
