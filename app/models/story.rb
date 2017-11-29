class Story < ApplicationRecord
  mount_uploader :picture, PictureUploader
  mount_uploader :audio, AudioUploader

  belongs_to :category
  # belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :level, presence: true
  validates :audio, presence: true
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

  def check_audio_content_type
    errors.add(:audio, "is invalid file type") if audio_changed? && audio.content_type !~ /\Aaudio\//
  end
end
