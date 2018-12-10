require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with nil name" do
    user = User.new(name: nil, password_digest: 12345678)
    expect(user).to be_valid
  end
  it "is valid with nil email" do
    user = User.new(email: nil, password_digest: 12345678)
    expect(user).to be_valid
  end
  it "is not valid without password" do
    user = User.new(name: "Tomeczek97")
    expect(user).to_not be_valid
  end
  it "changes username" do
    user = User.new(name: "Tomeczek97")
    user.name = "Pawełek97"
    expect(user.name).to eq "Pawełek97"
  end
  it "changes password digest" do
    user = User.new(name: "Tomeczek97", password_digest: 12345678)
    user.password_digest = 87654321
    expect(user.password_digest).to eq "87654321"

  end
end