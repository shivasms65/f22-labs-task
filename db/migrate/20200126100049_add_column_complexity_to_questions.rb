class AddColumnComplexityToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :complexity, :integer
  end
end
