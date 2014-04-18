class EditDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :body, :text
    add_column :documents, :title, :string
  end
end
