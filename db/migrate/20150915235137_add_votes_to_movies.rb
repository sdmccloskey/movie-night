class AddVotesToMovies < ActiveRecord::Migration
  def change
    add_column :votes, :movies_id, :integer
  end
end
