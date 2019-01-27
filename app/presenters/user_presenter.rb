# frozen_string_literal: true

class UserPresenter
  include ActionView::Helpers::UrlHelper

  def initialize(user)
    @user = user
  end

  attr_reader :user
  delegate :proffesion, :name, :website_url, :posts, :biography, to: :user

  def proffesion_name
    proffesion.blank? ? "Not Given" : proffesion
  end

  def biography_name
    biography.blank? ? "Not Given" : biography
  end

  def website_link
    if website_url.blank?
      "Not Given"
    else
      link_to website_url.to_s, "http://#{website_url}"
    end
  end

  def recent_tags
    posts.order(updated_at: :desc).take(3).map(&:tags).flatten
  end

  def recent_posts
    posts.order(updated_at: :desc).take(3)
  end
end
