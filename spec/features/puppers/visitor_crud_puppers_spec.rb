require 'rails_helper'

describe "as a visitor" do
  context "when I visit the puppers index" do
    it 'I can see only unsold puppers' do
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
        charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", parents:[charles, hazel])
        charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", parents:[charles, hazel])

        girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
        girl_b = Pupper.create(gender:"m", litter:charles_litter_2)
        girl_c = Pupper.create(gender:"make america care again", litter:charles_litter_2, sold: true)

        visit puppers_path 
        
        within "#pupper-#{girl_a.id}" do 
            expect(page).to have_content(girl_a.gender) 
        end 

        within "#pupper-#{girl_b.id}" do 
            expect(page).to have_content(girl_b.gender) 
        end 

        expect(page).to_not have_content(girl_c.gender) 
    end 

    it 'I can see the parents associated with each puppy' do
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
        charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", parents:[charles, hazel])
        charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", parents:[charles, hazel])

        girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
        girl_b = Pupper.create(gender:"m", litter:charles_litter_2)

        visit puppers_path

        within "#pupper-#{girl_a.id}" do 
            expect(page).to have_content(hazel.name) 
        end 
    end 
  end
end
