class ChangeStringtoTextinQuotesTable < ActiveRecord::Migration
  def change
    remove_column :quotes, :body
    add_column :quotes, :body, :text
    drop_table :projects
    drop_table :tasks
    drop_table :scrapings
    drop_table :teams
    drop_table :user_team_joins
  end
end
