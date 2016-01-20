require 'rails_helper'

RSpec.describe Peach, type: :model do
  it "creates a peach" do
    new_peach = Peach.create!(name: "Save the Rainforest", deadline: 5)

    expect(new_peach.name).to eq("Save the Rainforest")
    expect(new_peach.deadline).to eq(5)
  end
  it "updates peach" do
    new_peach = Peach.create!(name: "Save the Rainforest", deadline: 5)
    new_peach.update(name:"Save the world", deadline: 6)

    expect(new_peach.name).to eq("Save the world")
    expect(new_peach.deadline).to eq(6)
  end
end
