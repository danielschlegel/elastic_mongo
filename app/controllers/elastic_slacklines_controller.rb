class ElasticSlacklinesController < ApplicationController
  # GET /elastic_slacklines
  # GET /elastic_slacklines.json
  def index
    @elastic_slacklines = ElasticSlackline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @elastic_slacklines }
    end
  end

  # GET /elastic_slacklines/1
  # GET /elastic_slacklines/1.json
  def show
    @elastic_slackline = ElasticSlackline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @elastic_slackline }
    end
  end

  # GET /elastic_slacklines/new
  # GET /elastic_slacklines/new.json
  def new
    @elastic_slackline = ElasticSlackline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @elastic_slackline }
    end
  end

  # GET /elastic_slacklines/1/edit
  def edit
    @elastic_slackline = ElasticSlackline.find(params[:id])
  end

  # POST /elastic_slacklines
  # POST /elastic_slacklines.json
  def create
    @elastic_slackline = ElasticSlackline.new(params[:elastic_slackline])

    respond_to do |format|
      if @elastic_slackline.save
        format.html { redirect_to @elastic_slackline, notice: 'Elastic slackline was successfully created.' }
        format.json { render json: @elastic_slackline, status: :created, location: @elastic_slackline }
      else
        format.html { render action: "new" }
        format.json { render json: @elastic_slackline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /elastic_slacklines/1
  # PUT /elastic_slacklines/1.json
  def update
    @elastic_slackline = ElasticSlackline.find(params[:id])

    respond_to do |format|
      if @elastic_slackline.update_attributes(params[:elastic_slackline])
        format.html { redirect_to @elastic_slackline, notice: 'Elastic slackline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @elastic_slackline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elastic_slacklines/1
  # DELETE /elastic_slacklines/1.json
  def destroy
    @elastic_slackline = ElasticSlackline.find(params[:id])
    @elastic_slackline.destroy

    respond_to do |format|
      format.html { redirect_to elastic_slacklines_url }
      format.json { head :no_content }
    end
  end
end
