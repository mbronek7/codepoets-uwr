# frozen_string_literal: true

describe CreatePost do
  subject(:result) { transaction.call(input) }
  let(:user) { create :user }
  let(:transaction) { described_class.new }

  let(:post_data) do
    {
      title: "New Post",
      content: "<div><h1>Ruby on Rails</h1></div>",
      all_tags: "ruby",
      author_id: user.id
    }
  end

  context "with valid input" do
    let(:input) { post_data }

    it "it returns post" do
      expect(result.success).to be_instance_of(Post)
    end

    it "sends email notifications" do
      expect(SendNotifications).to receive(:call)
      result
    end

    it "sets correct author of post" do
      expect(result.success.author).to eql(user)
    end
  end

  context "with invalid input" do
    before(:each) do
      post_data[:title] = "NEW_POST_TITLE_THAT_HAS_MORE_THAN_25_CHARACTERS"
    end

    let(:invalid_post_message) do
      {
        title: ["size cannot be greater than 25"]
      }
    end

    let(:input) { post_data }

    it "it returns post" do
      expect(result.failure).to eql(invalid_post_message)
    end
  end
end
