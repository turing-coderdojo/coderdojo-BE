class AddEventCodeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_code, :string
  end
end
