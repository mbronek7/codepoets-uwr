# frozen_string_literal: true

describe PostValidator::NewPostSchema do
  subject(:result) { schema.call(input) }
  let(:schema) { described_class }
  let(:user) { create :user }

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

    it "is successful" do
      expect(result).to be_success
    end

    it "is not a failure" do
      expect(result).to_not be_failure
    end

    it "coerces to validated hash" do
      expect(Hash(result)).to eql(post_data)
    end

    it "returns an empty hash" do
      expect(result.messages).to be_empty
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

    it "is not successful" do
      expect(result).to_not be_success
    end

    it "is failure" do
      expect(result).to be_failure
    end

    it "coerces to validated hash" do
      expect(Hash(result)).to eql(post_data)
    end

    it "returns a hash with error messages" do
      expect(result.messages).to eql(
        invalid_post_message
      )
    end
  end
end
