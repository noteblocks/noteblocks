FactoryBot.define do
  factory :block do
    notebook
    name "My Test Block"
    data '{ "test":"this is test data" }'
    schema_version "v1"
  end
end
