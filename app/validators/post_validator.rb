# frozen_string_literal: true

class PostValidator
  NewPostSchema = Dry::Validation.Schema do
    configure do
      config.messages_file =
        Rails.root.join("config", "locales", "validation_errors.en.yml")
    end
    required(:title).filled(max_size?: 25)
  end
end
