require 'rails_helper'

RSpec.describe "when user sees a parent" do
  context "on the parents index page" do
    it "can delete each parent" do
      user = User.create(username: "admin", password: "password", role: 2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
      hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
      charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
      charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", breed:"Goldendoodle", parents:[charles, hazel])
      
      girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
      girl_b = Pupper.create(gender:"m", litter:charles_litter_2)

      visit admin_parents_path

      click_on(charles.name)
      
      within("#parent-#{charles.id}") do 
        click_on("Delete Parent :(")
      end 

      expect(current_path).to eq(admin_parents_path)
      expect(page).to_not have_content(charles.name)
      
    end
  end
end
