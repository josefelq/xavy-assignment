class AddDifficultyToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :difficulty, :integer
  end
end
