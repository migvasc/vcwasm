class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    t = Task.find(params[:id])
		#@results = Result.all
		h = Hash.new  
		r_set =  Result.where(:task_id => t.id).to_a
		#r1_set =  Result.all.to_a
		
		i =0
		j=0
		while r_set.length > 0   do
			
			h[r_set[i].id] = 1
			i=0
			j = 1
			
			while j < r_set.length  do
				
				
				if r_set[i].file_contents==r_set[j].file_contents
					r_set.delete(r_set[j])
					h[r_set[i].id] = h[r_set[i].id] + 1
					j = j - 1	
				end
				
			#	if r_set[i].file_contents==r_set[j].file_contents
					
			#		@strin = @strin + r_set[i].id.to_s + "EH IGUAL A " + r_set[j].id.to_s+ "  "
			#		
				
			#	end
				j= j + 1
			end
			
			if r_set.length > 0 
				r_set.delete(r_set[i])
			end
			
		end

		@results = Result.where(:task_id => t.id)
		
		@h =h    
		
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def handle_post_request
    
   testy="#{request.body.read}"
  
    r = Result.new(:filename => "teste",:content_type =>"application/octet-stream", :file_contents => testy, :task_id => params[:task_id])
    
    r.save
    t = Tasks.where(:id=>params[:task_id])
    
    redirect_to  Projects.where(:id=> t.project_id)
    
  
 end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:file, :project_id, :times_executed)
    end
    

end
