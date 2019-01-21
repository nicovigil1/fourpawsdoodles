require 'rails_helper'

describe 'Puppers' do
    context "create" do
        
    end

    context "read" do
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

    context "create" do
        it 'litter is automatically updated upon creation' do 
            user = User.create(username: "admin", password: "password", role: 2)
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")

            visit new_admin_litter_path

            fill_in "Breed",	with: "Golden Doodle"
            fill_in "Birthday", with: "12/12/1212"
            select 2, from: "Boys"
            select 3, from: "Girls"
            select "Hazel", from: "litter_parents_mother"
            select "Charles", from: "litter_parents_father"
            click_on "add litter"

            expect(Litter.first.name).to eq("Hazel-Charles Dec '12")
        end     
    end
    
end 