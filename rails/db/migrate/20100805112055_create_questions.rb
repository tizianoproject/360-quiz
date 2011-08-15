class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :key
      t.string :info

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
