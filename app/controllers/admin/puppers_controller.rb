class Admin::PuppersController < Admin::BaseController
    
    def index
        @puppers = Pupper.order(:id)
    end 

    def new
        @pupper = Pupper.new
    end 

    def create 
        litter = Litter.find[params[:litter_id]]
        #first - build litter
        Pupper.build_boys(litter, 0)
        # Pupper.build_boys(params)
        # build_girls
    end

    def toggle_sold
        pupper = Pupper.find(params[:format])
        pupper.toggle_sold
        pupper.save
        redirect_to request.referrer
    end 

    def edit 
        @pupper = Pupper.find(params[:id])
    end 

    private

    def litter_params
        require(params).permit(:puppers)
    end 

    # def convert_params
    #     breed = params[:pupper][:breed]
    #     sire_id = params[:sire][:parents].to_i
    #     dam_id = params[:dam][:parents].to_i
    #     parents = [Parent.find(dam_id), Parent.find(sire_id)]
    #     {breed:breed, parents:parents}
    # end

    # def num_boys 
    #     number_boys = params[:puppers][:boys].to_i
    # end

    # def num_girls 
    #     number_girls = params[:puppers][:girls].to_i
    # end 





    # def pupper_params
    #     require 'pry'; binding.pry
    #     breed = params.require(:pupper).permit(:breed)
    #     number_b_g = params.require(:puppers).permit(:boys, :girls)
    #     sire_id = params.require(:sire,).permit(:parents)
    #     dam_id = params.require(:dam).permit(:parents)

    #     [breed, number_b_g, sire_id, dam_id]
    # end

end 