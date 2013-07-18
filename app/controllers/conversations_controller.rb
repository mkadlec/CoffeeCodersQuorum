class ConversationsController < ApplicationController

  def index

    @sprint = params[:sprint]

    if @sprint.nil? || @sprint.empty?
      @conversations = Conversation.all
    else
      @conversations = Conversation.where('sprint = ?', @sprint)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @conversation = Conversation.find(params[:id])

    if @conversation.postedByUser.present?
      @user = User.find(@conversation.postedByUser)
    end

    @assign_to_users = User.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.json
  def new
    @conversation = Conversation.new
    logger.debug "In new!"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conversation }
    end
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.json
  def create
    logger.debug "In create!!"
    @conversation = Conversation.new(params[:conversation])
    @conversation.update_attributes(:postedByUser => current_user.id)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render json: @conversation, status: :created, location: @conversation }
      else
        format.html { render action: 'new' }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conversations/1
  # PUT /conversations/1.json
  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to conversations_url }
      format.json { head :no_content }
    end
  end

  def add_properties
    @conversation = Conversation.update(params[:conversationId], :assigned_to => params[:conversation][:assigned_to], :sprint => params[:conversation][:sprint], :points => params[:conversation][:points])

    respond_to do |format|
      format.js { render :layout => false, :partial => 'add_properties' }
    end
  end

end
