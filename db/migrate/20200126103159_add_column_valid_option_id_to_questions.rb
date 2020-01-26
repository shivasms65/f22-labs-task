class AddColumnValidOptionIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :valid_option_id, :integer
  end
end
