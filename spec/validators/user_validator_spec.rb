# frozen_string_literal: true

describe UserValidator::NewUserSchema do
  subject(:result) { schema.call(input) }

  let(:schema) { described_class }

  let(:valid_user_data) do
    {
      name: "Jane",
      email: "user@example.org",
      password: "password",
      password_confirmation: "password"
    }
  end

  let(:invalid_user_data) do
    {
      name: "",
      email: "fdsa.pl.dot.upper.org",
      password: "pas",
      password_confirmation: "passwords"
    }
  end

  context "with valid input" do
    let(:input) { { user: valid_user_data } }

    it "is successful" do
      expect(result).to be_success
    end

    it "is not a failure" do
      expect(result).to_not be_failure
    end

    it "coerces to validated hash" do
      expect(Hash(result)).to eql(user: valid_user_data)
    end

    it "returns an empty hash" do
      expect(result.messages).to be_empty
    end
  end

  context "with invalid input" do
    let(:invalid_user_message) do
      {
        email: ["is in invalid format"],
        name: ["must be filled", "size cannot be greater than 100"],
        password: ["size cannot be less than 6"]
      }
    end

    let(:input) { { user: invalid_user_data } }

    it "is not successful" do
      expect(result).to_not be_success
    end

    it "is failure" do
      expect(result).to be_failure
    end

    it "coerces to validated hash" do
      expect(Hash(result)).to eql(user: invalid_user_data)
    end

    it "returns a hash with error messages" do
      expect(result.messages).to eql(
        user: invalid_user_message
      )
    end

    describe "passwords not equal" do
      let(:invalid_user_data) do
        {
          name: "",
          email: "userexample.org",
          password: "password",
          password_confirmation: "passwords"
        }
      end

      let(:invalid_user_message) do
        {
          email: ["is in invalid format"],
          name: ["must be filled", "size cannot be greater than 100"],
          password: ["passwords not equal"]
        }
      end

      it "returns a hash with error messages" do
        expect(result.messages).to eql(
          user: invalid_user_message
        )
      end
    end
  end
end
