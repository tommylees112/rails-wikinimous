class AddVotesToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :votes, :integer
  end
end
