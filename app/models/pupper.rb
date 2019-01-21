class Pupper < ApplicationRecord
    belongs_to :litter
    has_many :parents, through: :litter

    def self.build_boys(litter, num)
        num.to_i.times do 
            Pupper.create(gender:"m", litter:litter)
        end
    end

    def self.build_girls(litter, num)
        num.to_i.times do 
            Pupper.create(gender:"f", litter:litter)
        end
    end

    def self.unsold
        Pupper.where(sold: false)
    end 

end
