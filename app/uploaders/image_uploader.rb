class ImageUploader < CarrierWave::Uploader::Base
#   include CarrierWave::MiniMagick
  
  storage :file
#   process :resize_to_fit => [300, 200]

  def store_dir
    "images/products"
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def filename
    "ID:#{object_id}"
  end
end
