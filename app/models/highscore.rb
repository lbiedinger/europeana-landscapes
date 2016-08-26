class Highscore < ActiveRecord::Base
  validates :score, numericality: {greater_than: 0, less_than: 10001}
  validates :initials, length: { maximum: 3 }
  before_save :normalize_initials

  def normalize_initials
    self.initials = self.initials.downcase.gsub(/[^0-9a-z ]/i, '').upcase if self.initials
  end

end