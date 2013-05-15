class CreateSeeSVeeFunCsvs < ActiveRecord::Migration
  def change
    create_table :see_s_vee_fun_csvs do |t|
      t.string :name
      t.text :code

      t.timestamps
    end
  end
end
