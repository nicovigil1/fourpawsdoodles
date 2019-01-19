require "rails_helper"
RSpec.describe "Admin Can Edit Parents" do
    it "can see edit link for parents" do
        admin = User.create(username: "admin", password: "password", role: 2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
        charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
        charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", breed:"Goldendoodle", parents:[charles, hazel])

        girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
        girl_b = Pupper.create(gender:"m", litter:charles_litter_2)

        visit admin_parent_path(charles)
        click_on("Edit")

        expect(page).to have_content("Edit #{charles.name}")
    end
    
    it "can edit parent's name" do
        admin = User.create(username: "admin", password: "password", role: 2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")

        visit admin_parent_path(charles)

        expect(page).to have_content("Charles")

        click_on("Edit")
    
        fill_in "Name",	with: "Charlie" 
        click_on("Submit")

        expect(current_path).to eq(admin_parent_path(charles))
        expect(page).to have_content("Charlie")
    end 

    
end
