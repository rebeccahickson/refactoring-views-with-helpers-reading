class Post < ActiveRecord::Base
  validate :is_title_case
  before_validation :make_title_case
  belongs_to :author

  private

  def is_title_case
    errors.add(:title, 'Title must be in title case') if title.split.any? { |w| w[0].upcase != w[0] }
  end

  def make_title_case
    self.title = title.titlecase
  end
end
