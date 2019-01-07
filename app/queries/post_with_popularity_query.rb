# frozen_string_literal: true

class PostWithPopularityQuery
  POPULARITY_RANGES = 5

  def self.call
    Post.find_by_sql ['
      SELECT
        id, title, impressions_count, slug, author_id,
      ntile(?) OVER (
        ORDER BY impressions_count ASC
      ) AS popularity
      FROM posts', POPULARITY_RANGES]
  end
end
