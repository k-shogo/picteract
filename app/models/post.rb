class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include Mongoid::Ancestry

  # ===== relation =====
  has_ancestry

  # belongs_to :director,
  #   class_name: 'User',
  #   inverse_of: 'my_events'
  # has_and_belongs_to_many :participants,
  #   class_name: 'User',
  #   inverse_of: 'invited_events'

  has_many :attachments,
    dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true

  # ===== model structure =====

  attr_accessible :to, :body, :attachments_attributes

  attr_reader :invite

  field :body, type: String

  def to=(ids)
    self.participant_ids = ids.split(",")
  end
end
