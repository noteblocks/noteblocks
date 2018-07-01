# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Notebook.create!([
  {id: 1, name: "Notebook 1", desc: "Test Notebook 1"},
  {id: 2, name: "Notebook 2", desc: "Test Notebook 2"}
])

Block.create!([
  {id: 1, notebook_id: 1, name: "Block 1", schema_version: 'v1', data: {}},
  {id: 2, notebook_id: 1, name: "Block 2", schema_version: 'v1', data: {}},
  {id: 3, notebook_id: 2, name: "Block 1", schema_version: 'v1', data: {}},
  {id: 4, notebook_id: 2, name: "Block 2", schema_version: 'v1', data: {}}
])
