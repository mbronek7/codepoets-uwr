require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "new post with author is valid" do
    user = User.new(name: "Pawełek95")
    post = Post.new(title: "Ruby jest super!", author: user)
    expect(post).to be_valid
  end
  it "visit count of new post equals 0" do
    user = User.new(name: "Pawełek95")
    post = Post.new(title: "Ruby is gr8!", author: user)
    expect(post.visit_count).to eq 0
  end
  it "post with null name is valid" do
    user = User.new(name: "Pawełek95", password_digest: 12345678)
    post = Post.new(author: user)
    expect(post).to be_valid
  end
  it "post with null author is not" do
    post = Post.new()
    expect(post).to_not be_valid
  end
  it "changes post titles" do
    user = User.new(name: "Pawełek95", password_digest: 12345678)
    post = Post.new(title: "Will change later", author: user)
    post.title = "Changed later"
    expect(post.title).to eq "Changed later"
  end

end