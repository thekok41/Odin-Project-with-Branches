class Comment < ApplicationRecord
  #A comment relates to a single article, it "belongs to" an article. 
  belongs_to :article
end
