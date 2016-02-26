class Comment < ActiveRecord::Base
  belongs_to :article, required: true
  belongs_to :user, required: true
end
