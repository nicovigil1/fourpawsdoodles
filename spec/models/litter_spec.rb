require 'rails_helper'

describe Litter do
    it 'can find a count of boys in the litter' do 
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
        charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])

        girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
        girl_b = Pupper.create(gender:"f", litter:charles_litter_1)
        boy_a = Pupper.create(gender:"m", litter:charles_litter_1)
        
        boys = charles_litter_1.gender_count("m")
        girls = charles_litter_1.gender_count("f")
        expect(boys).to eq(1)
        expect(girls).to eq(2)
    end 
    
    it 'can create any number of boy pups' do 
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
        litter = Litter.create(name: "testing", birthday: Time.now, breed:"Goldendoodle", parents: [charles, hazel])
        hash = litter
        
        Pupper.build_boys(hash, 3)

        expect(Pupper.all.count).to eq(3)
        expect(Pupper.first.gender).to eq("m")
        expect(Pupper.last.gender).to eq("m")
    end 
    
    it 'can create any number of girl pups' do 
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
        litter = Litter.create(name: "testing", birthday: Time.now, breed:"Goldendoodle", parents: [charles, hazel])
        hash = litter
        
        Pupper.build_girls(hash, 3)
        
        expect(Pupper.all.count).to eq(3)
        expect(Pupper.first.gender).to eq("f")
        expect(Pupper.last.gender).to eq("f")
    end

    it 'can find all litters with unsold puppies by a parent' do 
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
        litter_1 = Litter.create(name: "testing1", birthday: Time.now, breed:"Goldendoodle", parents: [charles, hazel])
        litter_2 = Litter.create(name: "testing", birthday: Time.now, breed:"Goldendoodle", parents: [charles, hazel])
        
        pup1 = Pupper.create(gender:"f", litter:litter_1)
        pup2 = Pupper.create(gender:"f", litter:litter_1, sold: true)
        pup3 = Pupper.create(gender:"m", litter:litter_2, sold: true)

        expect(Litter.unsold_by_parent(hazel)).to eq([litter_1])
    end
end
