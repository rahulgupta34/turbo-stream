class CreateLazyLoadings < ActiveRecord::Migration[7.0]
  def change
    create_table :lazy_loadings do |t|
      t.string :name
      t.string :avatar_url

      t.timestamps
    end
  end
end
