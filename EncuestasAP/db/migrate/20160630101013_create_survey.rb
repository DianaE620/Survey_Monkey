class CreateSurvey < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :user
      t.string :email
      t.string :password_digest
    end

    create_table :surveys do |t|
      t.belongs_to :user
      t.string :name
    end

    create_table :questions do |t|
      t.belongs_to :survey
      t.string :name
    end

    create_table :options do |t|
      t.belongs_to :question
      t.string :name
    end

    create_table :responses do |t|
      t.belongs_to :participation
      t.belongs_to :option
      t.string :response
    end

    create_table :participations do |t|
      t.belongs_to :user
      t.belongs_to :survey
      t.boolean :complete
    end
  end
end
