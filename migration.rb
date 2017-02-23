require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'lipsums.sqlite3'
)

class ApplicationMigration < ActiveRecord::Migration
  def change
    create_table "lipsums", force: true do |t|
      t.text  "name"
      t.text  "text"
    end
  end
end
