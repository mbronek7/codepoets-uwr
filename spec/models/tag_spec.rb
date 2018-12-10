require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with nil name" do
    tag = Tag.new(name: nil)
    expect(tag).to be_valid
  end
  it "changes name name" do
    tag = Tag.new(name: nil)
    tag.name = "TAG"
    expect(tag.name).to eq "TAG"
  end
end