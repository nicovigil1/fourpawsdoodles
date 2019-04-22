require "rails_helper"
describe "Admin Litter" do 
    context "admin read" do 
        it "I see a link to add a puppy to the show page" do 
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
            charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
            admin  = User.create(username: "admin", password: "password", role: 2)
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
            
            visit admin_litter_path(charles_litter_1)



            expect(page).to have_button("Add A Puppy to this Litter") 
            click_button "Add A Puppy to this Litter"
            select 3, from: "Boys"
            select 2, from: "Girls"
            click_on("Create Pupper")
            expect(current_path).to eq(new_admin_pupper_path)
        end 

        it 'I see all of the puppers includeing those for sale' do
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
            charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
            charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", breed:"Goldendoodle", parents:[charles, hazel])

            girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
            boy_a = Pupper.create(gender:"m", litter:charles_litter_2, sold: true)
 
            admin = User.create(username: "admin", password: "password", role: 2)
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
            
            visit admin_litters_path
            within("pupper-#{boy_a.id}") do 
                expect(page).to have_content(boy_a.id)
                expect(page).to have_content(boy_a.gender)
                expect(page).to have_content(boy_a.breed)
            end 

            within("pupper-#{girl_a.id}") do 
                expect(page).to have_content(girl_a.id)
                expect(page).to have_content(girl_a.gender)
                expect(page).to have_content(girl_a.breed)
            end 
        end     

    end 

    context "admin create" do
        it 'can visit the create a new litter page' do
            user = User.create(username: "admin", password: "password", role: 2)
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

            visit admin_litters_path

            click_on("add a litter")

            expect(current_path).to eq(new_admin_litter_path)
        end 

        xit 'can fill in the form and create a litter' do
            visit litters_path
            click_on("add a litter")

            fill_in "Name",	    with: "Charles 3"
            fill_in "Birthday", with: "1-1-1970"
            fill_in "Mother",   with: "Charles"
            fill_in "Father",   with: "Hazel"  
            click_on "add litter"

            expect(current_path).to eq(litters_path) 
            expect(page).to have_content("Charles 3")
        end
    end
end