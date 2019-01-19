require 'rails_helper'
RSpec.describe "it can create a new parent" do
    it "can visit the new parent page" do
        admin = User.create(username: "admin", password: "password", role: 2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit new_admin_parent_path

        expect(current_path).to eq(new_admin_parent_path)
    end

    it 'can fill in a form & create a parent' do
        admin = User.create(username: "admin", password: "password", role: 2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        
        visit new_admin_parent_path

        fill_in "Name",	    with: "how now" 
        fill_in "Breed",	with: "brown cow"
        fill_in "Genetics",	with: "F1" 
        fill_in "Role",	    with: "sire" 
        click_on "Create Parent"
        
        expect(page).to have_content("how now")
    end
    
    it 'can fill in a form & create a parent' do
        admin = User.create(username: "admin", password: "password", role: 2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        
        visit new_admin_parent_path
        
        #fill_in "Name",	with: "how now" 
        fill_in "Breed",	with: "brown cow"
        fill_in "Genetics",	with: "F1" 
        fill_in "Role",	    with: "sire" 
        click_on "Create Parent"

        expect(page).to have_content("Name can't be blank") 
    end

    
    
end
