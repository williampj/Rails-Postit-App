class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.timestamps # adds two columns - created_at and updated_at
    end
  end
end

➜  postit-template git:(master) ✗ rails generate migration add_timestamps_to_posts
      invoke  active_record
      create    db/migrate/20200428100041_add_timestamps_to_posts.rb