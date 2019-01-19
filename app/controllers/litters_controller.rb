class LittersController < ApplicationController
    def index
        @litters = Litter.unsold
    end 

    def show
        @litter = Litter.find(params[:id])
        @parents = @litter.parents
        @puppers = @litter.puppers 
        @boys_count = @litter.gender_count("m")
        @girls_count = @litter.gender_count("f")
    end 
    
    # def new
    #     @litter = Litter.new
    #     @parents = Parent.all
    # end

    # def create
    #     litter = Litter.create(litter_params)
    #     Pupper.build_boys(litter, pupper_params[:boys])
    #     Pupper.build_girls(litter, pupper_params[:girls])
    #     redirect_to litter_path(litter)
    # end


    # private

    # def litter_params
    #     litter = params.require(:litter).permit(:name, :birthday, :breed)
    #     parents = params[:litter][:parents]
    #     mother = Parent.find(parents[:mother])
    #     father = Parent.find(parents[:father])
    #     {parents:[mother, father]}.merge(litter)
    # end

    # def pupper_params
    #     params.require(:litter).permit(:boys, :girls)
    # end 
    
end 