class RemoveCurrentShelterIdFromPets < ActiveRecord::Migration[5.1]
  def change
    remove_column :pets, :current_shelter_id, :integer
  end
end
