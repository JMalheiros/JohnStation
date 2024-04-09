class AddVisibleToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :visible, :boolean, default: true
  end
end
