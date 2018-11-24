# frozen_string_literal: true

class PostWithPopularityQuery
  POPULARITY_RANGES = 5

  def self.call
    Post.find_by_sql ['
      SELECT
        id, title, visit_count, slug,
      ntile(?) OVER (
        ORDER BY visit_count ASC
      ) AS popularity
      FROM posts', POPULARITY_RANGES]
  end
end
