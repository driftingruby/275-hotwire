class Comment < ApplicationRecord
  belongs_to :ticket
  has_rich_text :content
  broadcasts_to :ticket
  # after_create_commit -> { broadcast_append_to ticket }
  # after_destroy_commit -> { broadcast_remove_to ticket }
  # after_update_commit -> { broadcast_replace_to ticket }
end
