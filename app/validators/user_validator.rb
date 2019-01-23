# frozen_string_literal: true

class UserValidator
  EMAIL_REGEX = /\A[\w \.]+@[\w \.]+\z/.freeze

  NewUserSchema = Dry::Validation.Schema do
    configure do
      configure { config.namespace = :user }
      config.messages_file =
        Rails.root.join("config", "locales", "validation_errors.en.yml")

      def same_password?(password, password_confirmation)
        password == password_confirmation
      end
    end
    required(:user).schema do
      required(:name).filled(max_size?: 100)
      required(:email).filled(format?: EMAIL_REGEX)
      required(:password).filled(min_size?: 6)
      required(:password_confirmation).value(:filled?)
      rule(passwords_eql?: %i(password password_confirmation)) do |a, b|
        a.same_password?(b)
      end
    end
  end
end
