class Document < ActiveRecord::Base

  scope :search, ->(q) { where('content like ?', "%#{q}%") }
end
