class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :file, FileUploader

  # ===== relation =====
  belongs_to :post

  # ===== model structure =====
  attr_accessible :file, :file_cache, :remove_file
end
