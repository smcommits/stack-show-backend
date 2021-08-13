class AddStackListToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :stack_list, :string
  end
end
