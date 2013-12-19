class ChangeStringtoTextinQuotesTable < ActiveRecord::Migration
  def change
    remove_column :quotes, :body
    add_column :quotes, :body, :text

  end
end
