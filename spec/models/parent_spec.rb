require 'rails_helper'

describe "Parents Model" do
    it "can find all the mothers" do
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")

        expect(Parent.mothers).to eq([hazel])
    end

    it "can discover vader is luke's father" do
        charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
        hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")

        expect(Parent.fathers).to eq([charles])
    end
end
