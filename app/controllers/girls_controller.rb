class GirlsController < ApplicationController
  # GET /girls
  # GET /girls.json
  def index
    @girls = Girl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @girls }
    end
  end

  # GET /girls/1
  # GET /girls/1.json
  def show
    @girl = Girl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @girl }
    end
  end

  # GET /girls/new
  # GET /girls/new.json
  def new
    @girl = Girl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @girl }
    end
  end

  # GET /girls/1/edit
  def edit
    @girl = Girl.find(params[:id])
  end

  # POST /girls
  # POST /girls.json
  def create
    @girl = Girl.new(params[:girl])

    respond_to do |format|
      if @girl.save
        format.html { redirect_to @girl, notice: 'Girl was successfully created.' }
        format.json { render json: @girl, status: :created, location: @girl }
      else
        format.html { render action: "new" }
        format.json { render json: @girl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /girls/1
  # PUT /girls/1.json
  def update
    @girl = Girl.find(params[:id])

    respond_to do |format|
      if @girl.update_attributes(params[:girl])
        format.html { redirect_to @girl, notice: 'Girl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @girl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /girls/1
  # DELETE /girls/1.json
  def destroy
    @girl = Girl.find(params[:id])
    @girl.destroy

    respond_to do |format|
      format.html { redirect_to girls_url }
      format.json { head :no_content }
    end
  end
end
