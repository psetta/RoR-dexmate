class AddAvatarToCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :mod_calendars, :photo, :string
  end
end
