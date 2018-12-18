# frozen_string_literal: true

class UserValidator
  EMAIL_REGEX = /\A[\w \.]+@[\w \.]+\z/

  NewUserSchema = Dry::Validation.Schema do
    configure do
      config.messages_file =
        Rails.root.join("config", "locales", "validation_errors.en.yml")
    end
    required(:user).schema do
      required(:name).filled(max_size?: 100)
      required(:email).filled(format?: EMAIL_REGEX)
      required(:password).filled(eql?: :password_confirmation)
      required(:password).filled(min_size?: 6)
      required(:password_confirmation).value(:filled?)
    end
  end
end
