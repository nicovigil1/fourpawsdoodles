require 'rails_helper'

describe 'Puppers' do
    context "create" do
        
    end

    context "read" do
        it 'can see all current puppers' do
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
            charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", parents:[charles, hazel])
            charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", parents:[charles, hazel])

            girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
            girl_b = Pupper.create(gender:"m", litter:charles_litter_2)

            visit puppers_path 
            
            within "#pupper-#{girl_a.id}" do 
                expect(page).to have_content(girl_a.gender) 
            end 

            within "#pupper-#{girl_b.id}" do 
                expect(page).to have_content(girl_b.gender) 
            end 
        end 

        it 'can create new puppers' do 
            user = User.create(username: "admin", password: "password", role: 2)
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

            visit admin_puppers_path
            
            click_on "add a pupper"

            expect(current_path).to eq(new_admin_pupper_path) 
        end 

        xit 'can make any number of new puppers with a litter' do 
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")


            visit new_admin_pupper_path

            fill_in "Breed",	with: "Golden Doodle"
            select 2, from: "Boys"
            select 3, from: "Girls"
            find("#sire_parents").find(:xpath, "option[1]").select_option
            find("#dam_parents").find(:xpath, "option[2]").select_option
            click_on "Create Pupper"
        end 

        
    end
    
    

end 