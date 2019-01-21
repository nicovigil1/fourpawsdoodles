require 'rails_helper'

describe "a specification" do
    it '.unsold - can find all of the unsold puppies' do
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
        charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", parents:[charles, hazel])
        charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", parents:[charles, hazel])

        girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
        girl_b = Pupper.create(gender:"m", litter:charles_litter_2)
        girl_c = Pupper.create(gender:"make america care again", litter:charles_litter_2, sold: true)

        expect(Pupper.unsold).to include(girl_a, girl_b)
        expect(Pupper.unsold).to_not include(girl_c)
    end



    
end
