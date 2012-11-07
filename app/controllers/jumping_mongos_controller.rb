class JumpingMongosController < ApplicationController

  def search
    @search = Search.new(params[:search])
    if @search.query.present?
      @jumping_mongos = JumpingMongo.search @search.query, :per_page => 50, :load => true
    else
      @jumping_mongos = JumpingMongo.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @elastic_slacklines }
    end
  end

  # GET /jumping_mongos/1
  # GET /jumping_mongos/1.json
  def show
    @jumping_mongo = JumpingMongo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jumping_mongo }
    end
  end

  # GET /jumping_mongos/new
  # GET /jumping_mongos/new.json
  def new
    @jumping_mongo = JumpingMongo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jumping_mongo }
    end
  end

  # GET /jumping_mongos/1/edit
  def edit
    @jumping_mongo = JumpingMongo.find(params[:id])
  end

  # POST /jumping_mongos
  # POST /jumping_mongos.json
  def create
    @jumping_mongo = JumpingMongo.new(params[:jumping_mongo])

    respond_to do |format|
      if @jumping_mongo.save
        format.html { redirect_to @jumping_mongo, notice: 'Jumping mongo was successfully created.' }
        format.json { render json: @jumping_mongo, status: :created, location: @jumping_mongo }
      else
        format.html { render action: "new" }
        format.json { render json: @jumping_mongo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jumping_mongos/1
  # PUT /jumping_mongos/1.json
  def update
    @jumping_mongo = JumpingMongo.find(params[:id])

    respond_to do |format|
      if @jumping_mongo.update_attributes(params[:jumping_mongo])
        format.html { redirect_to @jumping_mongo, notice: 'Jumping mongo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jumping_mongo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jumping_mongos/1
  # DELETE /jumping_mongos/1.json
  def destroy
    @jumping_mongo = JumpingMongo.find(params[:id])
    @jumping_mongo.destroy

    respond_to do |format|
      format.html { redirect_to search_jumping_mongos_url }
      format.json { head :no_content }
    end
  end
end
