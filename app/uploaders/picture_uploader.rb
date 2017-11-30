class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'jpg'
  process :tags => ['post_picture']

  def extension_whitelist
   %w(jpg jpeg gif png)
  end

  version :thumb do
   process resize_to_fit: [180, 180]
  end

  version :small do
   process resize_to_fit: [240, 300]
  end

  version :medium do
   process resize_to_fit: [450, 450]
  end
end
