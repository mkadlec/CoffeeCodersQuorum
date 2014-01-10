class SprintsController < ApplicationController

  before_filter :check_privileges!, except: [:index, :show]

  def index
  	@sprints = Sprint.where('active = ?', true)  

	respond_to do |format|
	format.html # index.html.erb
	format.json { render json: @sprints }
    end
  end

  def create
  	logger.debug "Create!"
  	@sprint = Sprint.new(params[:sprint])
  	@sprint.update_attributes(:active => true)
  	@sprint.save
  	redirect_to @sprint
  end

  def show
  	redirect_to action: "index"
  end

  def delete
    @sprint = Sprint.find(params[:id])
    @sprint.destroy

    logger.debug "Delete!"

    redirect_to action: "index"
  end

end
