class Litter < ApplicationRecord
    has_many :parent_litters
    has_many :parents, through: :parent_litters
    has_many :puppers


    def gender_count(gender)
        puppers.where("gender = '#{gender}'").count 
    end

    # def find_parents(parents)
    #     ans = []
    #     parents.each do |parent|
    #         ans << Parent.find_by(name: parent)
    #     end
    #     ans
    # end 

    def self.unsold
        Litter.joins(:puppers).where("puppers.sold = false")
    end 

    def self.unsold_by_parent(parent)
        Litter.joins(:parents).joins(:puppers).where("puppers.sold = false AND parents.id = ?", parent.id)
    end 
end 