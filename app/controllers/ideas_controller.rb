class IdeasController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy]
  helper_method :can_edit?
    
  def can_edit?
    current_user and @idea.can_edit?(current_user)
  end

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  def recent
    @ideas = Idea.all

    respond_to do |format|
      format.html { render :template => 'ideas/index' }
      format.json { render json: @ideas }
    end
  end

  def popular
    @ideas = Idea.all

    respond_to do |format|
      format.html { render :template => 'ideas/index' }
      format.json { render json: @ideas }                      
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])

    render_not_found and return unless @idea
    render_forbidden and return unless can_edit?
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])
    @idea.user = current_user

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    render_not_found and return unless @idea
    render_forbidden and return unless can_edit?

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])

    render_not_found and return unless @idea
    render_forbidden and return unless can_edit?

    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :ok }
    end
  end
end
