FactoryBot.define do
  factory :block do
    notebook
    name "My Test Block"
    data {}
    schema_version "v1"
  end
end
