class ParentLitter < ApplicationRecord
    belongs_to :parent
    belongs_to :litter
end 