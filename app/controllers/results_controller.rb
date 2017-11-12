class ResultsController < ApplicationController
	before_action :set_result, only: [:show, :edit, :update, :destroy]
	protect_from_forgery with: :null_session
			def post_example
				testy="#{request.body.read}"
				r = Result.new(:filename => "teste",:content_type =>"application/octet-stream", :file_contents => testy, :task_id => request.headers['task-id'])
				r.save
				render text:  request.headers['EITA']
			end
		# GET /results
	# GET /results.json
	def index
		@strin=""
		#@results = Result.all
		h = Hash.new  
		r_set =  Result.where(:task_id => '6').to_a
		#r1_set =  Result.all.to_a
		
		i =0
		j=0

		
		while r_set.length > 0   do
			
			h[r_set[i].id] = 1
			@strin = @strin + "TAH VERIFICANDO O I "+ i.to_s + " q se refere ao" + r_set[i].id.to_s
			i=0
			j = 1
			
			while j < r_set.length  do
				
				
				if r_set[i].file_contents==r_set[j].file_contents
					@strin = @strin + "VAI DELETAR O  j "+j.to_s + " q se refere ao" + r_set[j].id.to_s
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

		@results = Result.where(:task_id => '6')
		@h =h    
	end

	# GET /results/1
	# GET /results/1.json
	def show
	end

	# GET /results/new
	def new
		@result = Result.new
	end

	# GET /results/1/edit
	def edit
	end

	# POST /results
	# POST /results.json
	def create
		@result = Result.new(result_params)

		respond_to do |format|
			if @result.save
				format.html { redirect_to @result, notice: 'Result was successfully created.' }
				format.json { render :show, status: :created, location: @result }
			else
				format.html { render :new }
				format.json { render json: @result.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /results/1
	# PATCH/PUT /results/1.json
	def update
		respond_to do |format|
			if @result.update(result_params)
				format.html { redirect_to @result, notice: 'Result was successfully updated.' }
				format.json { render :show, status: :ok, location: @result }
			else
				format.html { render :edit }
				format.json { render json: @result.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /results/1
	# DELETE /results/1.json
	def destroy
		@result.destroy
		respond_to do |format|
			format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_result
		@result = Result.find(params[:id])
	end
		# Never trust parameters from the scary internet, only allow the white list through.
	def result_params
		params.require(:result).permit(:file, :task_id)
	end

	
end