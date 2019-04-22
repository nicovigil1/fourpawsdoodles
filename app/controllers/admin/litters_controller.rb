class Admin::LittersController < Admin::BaseController

    def index
        @litters = Litter.all
    end 

    def show
        @litter = Litter.find(params[:id])
        @parents = @litter.parents
        @puppers = @litter.puppers 
        @boys_count = @litter.gender_count("m")
        @girls_count = @litter.gender_count("f")
        @sold_count = @litter.sold_count
    end 
    
    def new
        @litter = Litter.new
        @mothers = Parent.mothers
        @fathers = Parent.fathers
    end

    def create
        litter = Litter.create(litter_params)
        Pupper.build_boys(litter, pupper_params[:boys])
        Pupper.build_girls(litter, pupper_params[:girls])
        redirect_to litter_path(litter)
    end


    private

    def litter_params
        litter = params.require(:litter).permit(:birthday, :breed)
        parents = params[:litter][:parents]
        mother = Parent.find(parents[:mother])
        father = Parent.find(parents[:father])
        date = litter[:birthday].to_date
        name = (litter[:name] = date.strftime("#{mother.name}-#{father.name} %b '%y"))
        {parents:[mother, father]}.merge(litter)
    end

    def pupper_params
        params.require(:litter).permit(:boys, :girls)
    end 

end 