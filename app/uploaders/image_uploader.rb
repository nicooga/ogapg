class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "app/assets/images/products"
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def filename
    "ID:#{object_id}"
  end
end
