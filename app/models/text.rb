class Text < ApplicationRecord
  has_many :read_progresses, dependent: :destroy

  with_options presence: true do
    validates :genre
    validates :title
    validates :content
  end

  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  RAILS_GENRE_LIST = %w[basic git ruby rails].freeze
  PHP_GENRE_LIST = %w[php].freeze

  def self.genre_list(genre)
    if genre == "php"
      where(genre: Text::PHP_GENRE_LIST)
    else
      where(genre: Text::RAILS_GENRE_LIST)
    end
  end

  def read_by?(user)
    read_progresses.exists?(user_id: user.id)
  end
end
