class Admin::ParentsController < Admin::BaseController

    def index
        @parents = Parent.all        
    end 

    def show 
        @parent = Parent.find(params[:id])
        @litters = Parent.find(params[:id]).litters
    end 

    def new
        @parent = Parent.new
    end
    
    def create
        @parent = Parent.new(parent_params)
        if @parent.save            
            redirect_to admin_parents_path
        else
            @errors = @parent.errors.full_messages
            render new_admin_parent_path
        end 
    end

    def destroy
        parent = Parent.find(delete_parent)
        parent.destroy
        
        redirect_to admin_parents_path
    end 
    
    def edit
        @parent = Parent.find(params[:id])
    end 

    def update
        @parent = Parent.find(params[:id])
        @parent.update(parent_params)
        redirect_to admin_parent_path(@parent)
    end

    private 

    def parent_params
        params.require(:parent).permit(:name, :breed, :genetics, :role)
    end

    def delete_parent
        params.require(:id)
    end 
end 