class TasklistController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def show
        
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(tasklist_params)
        
        if @task.save
            flash[:success] = "task が正常に投稿されました。"
            redirect_to @task
        else 
            flash.now[:danger] = "task が投稿されませんでした。"
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @task.update(tasklist_params)
            flash[:success] = "task が正常に更新されました。"
            redirect_to @task
        else
            flash.now[:danger] = "task が更新されませんでした。"
            render :edit
        end
    end
    
    def destroy
        @task.destroy
    flash[:success] = "task は正常に削除されました。"
    redirect_to tasklist_url
    end
    
    private

    def set_tasklist
    @task = Task.find(params[:id])
    end

    def tasklist_params
    params.require(:task).permit(:content, :title)
    end
end
