class User < ApplicationRecord
  enum status: {zero: 0, one: 1, two: 2, three: 3, four: 4}

  default_scope -> { order(furigana: :asc) }
end
