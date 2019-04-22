require 'rails_helper'

describe "Visitor Litter" do
    context "visitor read" do
        it "can visit the litter show page" do
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
            charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
            charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", breed:"Goldendoodle", parents:[charles, hazel])
            
            girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
            girl_b = Pupper.create(gender:"m", litter:charles_litter_2)

            visit litters_path

            expect(page).to have_content(charles_litter_1.name) 

            within("#litter-#{charles_litter_2.id}") do
                expect(page).to have_content(charles_litter_2.name) 
                expect(page).to have_content(charles_litter_2.birthday) 
                expect(page).to have_content(charles_litter_2.parents[0].name)
                expect(page).to have_content(charles_litter_2.parents[1].name)
                expect(page).to have_content(charles_litter_2.breed)
            end 

            click_on charles_litter_2.name 

            expect(page).to have_content(charles_litter_2.name) 
            expect(page).to have_content(charles_litter_2.birthday) 
            expect(page).to have_content(charles_litter_2.parents[0].name)
            expect(page).to have_content(charles_litter_2.parents[1].name)
            expect(page).to have_content(charles_litter_2.gender_count("m"))
            expect(page).to have_content(charles_litter_2.gender_count("f"))

        end

        it 'can link to and see the litter show page' do 
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
            charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
            charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", breed:"Goldendoodle", parents:[charles, hazel])
            
            girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
            girl_b = Pupper.create(gender:"m", litter:charles_litter_2)

            visit litters_path

            click_on('charles 1')

            expect(current_path).to eq(litter_path(charles_litter_1))
            expect(page).to have_content(charles_litter_1.name) 

            # FIXME - MAKE MORE SPECIFIC LATER (WITHIN STATEMENT?)
            expect(page).to have_content(charles_litter_1.puppers[0].gender) 
        end 

        it 'can see only litters with unsold puppers' do 
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
            litter_1 = Litter.create(name: "testing1", birthday: Time.now, breed:"Goldendoodle", parents: [charles, hazel])
            litter_2 = Litter.create(name: "bla", birthday: Time.now, breed:"Goldendoodle", parents: [charles, hazel])
            
            pup1 = Pupper.create(gender:"f", litter:litter_1)
            pup2 = Pupper.create(gender:"f", litter:litter_1, sold: true)
            pup3 = Pupper.create(gender:"m", litter:litter_2, sold: true)

            user = User.create(username: "admin", password: "password", role: 2)
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
            
            visit litters_path 

            expect(page).to have_content(litter_1.name) 
            expect(page).to_not have_content(litter_2.name) 
        end
    end
end
