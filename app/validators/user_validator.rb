# frozen_string_literal: true

class UserValidator
  EMAIL_REGEX = /\A[\w \.]+@[\w \.]+\z/

  NewUserSchema = Dry::Validation.Schema do
    configure do
      config.messages_file =
        Rails.root.join('config', 'locales', 'validation_errors.en.yml')
    end
    required(:user).schema do
      required(:name).filled(max_size?: 100)
      required(:email).filled(format?: EMAIL_REGEX)
    end
  end
end
