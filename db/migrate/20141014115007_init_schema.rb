class InitSchema < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :email
      t.string :password
      t.text :name
      t.string :avatar 
      t.timestamps
    end

    create_table :todos do |t|
      t.boolean :doing
      t.boolean :done
      t.integer :owner_id
      t.datetime :deadline
      t.text :title
      t.integer :project_id
      t.boolean :deleted
      t.datetime :deltime
      t.timestamps
    end

    create_table :projects do |t|
      t.text :title
      t.text :description
      t.string :team_id
      t.timestamps
    end

    create_table :project_users do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end

    create_table :comments do |t|
      t.integer :author_id
      t.text :content
      t.string :target_type
      t.integer :target_id
      t.timestamps
    end

    create_table :teams do |t|
      t.timestamps
    end

    create_table :team_users do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :access
      t.timestamps
    end

    create_table :events do |t|
      t.integer :author_id
      t.text :author
      t.integer :project_id
      t.integer :target_id
      t.string :target_type
      t.integer :action
      t.text :title
      t.text :content
      t.text :ext 
      t.timestamps
    end

  end
end
