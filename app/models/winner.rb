class Winner < ActiveRecord::Base
  belongs_to :product
  belongs_to :bidding
end
