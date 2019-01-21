class Parent < ApplicationRecord 
    has_many :parent_litters, dependent: :destroy
    has_many :litters, through: :parent_litters
    has_many :puppers

    validates_presence_of :name, on: :create, message: "can't be blank"
    validates_presence_of :breed, on: :create, message: "can't be blank"
    validates_presence_of :genetics, on: :create, message: "can't be blank"
    validates_presence_of :role, on: :create, message: "can't be blank"

    def self.mothers
        Parent.where(role: "dam")
    end 

    def self.fathers
        Parent.where(role: "sire")
    end 
end 