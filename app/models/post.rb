class Post < ApplicationRecord
  def formatted_created_at
    created_at.strftime("%Y-%m-%d %H:%M")
  end
end
