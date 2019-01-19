require "rails_helper"

describe "Authentication" do
  context "when a user attempts to log in" do
    it "with good credentials they can log in and out" do
        admin = User.create(username: "admin", password:"password", role: "admin")
        visit login_path

        fill_in "Username",	with: "admin" 
        fill_in "Password",	with: "password" 
        click_on "log in"

        expect(current_path).to eq(admin_litters_path)
        expect(page).to have_content("Admin Litters") 

        within ".navbar" do 
          click_on "log out"
        end
        expect(page).to_not have_content("log out")
    end 

    end

    it 'with bad credentials' do
        visit login_path

        click_on "log in"

        expect(current_path).to eq(login_path)
        expect(page).to have_content("An error occured.") 
    end
end
