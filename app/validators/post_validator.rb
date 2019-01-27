# frozen_string_literal: true

class PostValidator
  NewPostSchema = Dry::Validation.Schema do
    required(:title).filled(max_size?: 25)
  end
end
