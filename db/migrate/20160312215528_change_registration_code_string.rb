class ChangeRegistrationCodeString < ActiveRecord::Migration
  def change
    change_table :stores do |t|
      t.change :registration_code, :string
    end
  end
end
