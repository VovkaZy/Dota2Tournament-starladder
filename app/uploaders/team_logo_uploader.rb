# frozen_string_literal: true

class TeamLogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process resize_to_fill: [200, 200]
  # process scale: [200, 200]
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end
  # version :normal do
  #  process resize_to_fill: [100, 100]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:

  def extension_white_list
    %w[jpg jpeg png]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details
  # def filename
  #   "something.jpg" if original_filename
  # end

  def default_url(*)
    ActionController::Base.helpers.asset_path('default_team_image.jpg')
  end
end
