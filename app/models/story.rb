class Story < ApplicationRecord
  has_attached_file :file
  validates_attachment_content_type :file, content_type: /\Aaudio\/.*\z/

  has_attached_file :picture, styles: { medium: "450x450>", thumb: "180x180>" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  belongs_to :category


  validates :title, presence: true
  validates :author, presence: true
  validates :level, presence: true
  validates :file, presence: true
  validates :picture, presence: true

  def next_story
    @story = Story.where("id > ?", self.id ).first
  end

  def previous_story
    @story = Story.where("id < ?", self.id).last
  end

  def self.which_level(level)
    where(level: level)
  end

end
