class AddLinkTextToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :link_text, :string
  end

  def self.down
    remove_column :pages, :link_text
  end
end
