class CreateCallBackResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :call_back_responses do |t|
      t.string :body

      t.timestamps
    end
  end
end
