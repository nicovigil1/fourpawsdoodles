require 'rails_helper'

RSpec.describe "user can see moms and dads" do
    
    context "when I visit the dogs index page" do
  
        it 'can visit the page' do 

            visit parents_path

            expect(current_path).to eq(parents_path)
        end 

        it 'can see both moms and dads' do
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")

            visit parents_path

            within('#parents-table') do 
                expect(page).to have_content(charles.name)
                expect(page).to have_content(charles.breed)
                expect(page).to have_content(charles.genetics)
                expect(page).to have_content(charles.role)

                expect(page).to have_content(hazel.name)
                expect(page).to have_content(hazel.breed)
                expect(page).to have_content(hazel.genetics)
                expect(page).to have_content(hazel.role)
            end 
        end
    end

    context "it can view a parents and it's litters" do

        it "can link to the parents show page" do
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")

            visit parents_path
            
            click_link('Hazel')

            expect(current_path).to eq(parent_path(hazel))
        end 

        it "can see the parent data" do
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")

            visit parent_path(charles)

            within('.parent') do 
                expect(page).to have_content(charles.name) 
                expect(page).to have_content(charles.breed) 
                expect(page).to have_content(charles.genetics) 
                expect(page).to have_content(charles.role) 
            end 
        end
        

        it "can see all the litters associated with the puppy" do 
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
            charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
            charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", breed:"Goldendoodle", parents:[charles, hazel])
            
            girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
            girl_b = Pupper.create(gender:"m", litter:charles_litter_2)
            
            visit parent_path(charles)

            within('#litters') do 
                expect(page).to have_content(girl_a.gender)
            end
        end

        it 'can click on the parent name and link to the show' do
            ## FIXME - DO THIS EVERYWHRE YOU SEE A NAME!!! 
            ## ALSO WORK ON FIXING THE NAMING IN THE TABLE FOR THE LITTERS
            charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
            hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
            charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", parents:[charles, hazel])
            charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", parents:[charles, hazel])
            
            girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
            girl_b = Pupper.create(gender:"m", litter:charles_litter_2)

            visit parents_path

            click_on("Charles")

            expect(current_path).to  eq(parent_path(charles))

        end 
    end                        
end
