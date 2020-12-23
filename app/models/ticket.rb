class Ticket < ApplicationRecord
  has_rich_text :content
  has_many :comments, dependent: :destroy

  broadcasts
  # after_create_commit -> { broadcast_append_to self }
  # after_destroy_commit -> { broadcast_remove_to self }
  # after_update_commit -> { broadcast_replace_to self }
end
