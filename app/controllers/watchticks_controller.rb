require 'yahoofinance'
class WatchticksController < ApplicationController
  #
  # GET /watchticks
  # GET /watchticks.json
  def index
    # this downloads from database
    @watchticks = Watchtick.all
    qt          = YahooFinance::StandardQuote
    @watchticks.each do |w|
      tmp_last_trade  = YahooFinance::get_quotes(qt, w.tick )[w.tick]
      w.closing_price = tmp_last_trade.lastTrade unless tmp_last_trade.nil?
    end

    respond_to do |format|
      format.html # index.html.erb
      #format.json {}
      #format.js{}
    end
  end

  # GET /watchticks/1
  # GET /watchticks/1.json
  def show
    @watchtick = Watchtick.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @watchtick }
    end
  end

  # GET /watchticks/new
  # GET /watchticks/new.json
  def new
    @watchtick = Watchtick.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @watchtick }
    end
  end

  # GET /watchticks/1/edit
  def edit
    @watchtick = Watchtick.find(params[:id])
  end

  # POST /watchticks
  # POST /watchticks.json
  def create
    @watchtick = Watchtick.new(params[:watchtick])

    respond_to do |format|
      if @watchtick.save
        format.html { redirect_to @watchtick, notice: 'Watchtick was successfully created.' }
        format.json { render json: @watchtick, status: :created, location: @watchtick }
      else
        format.html { render action: "new" }
        format.json { render json: @watchtick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /watchticks/1
  # PUT /watchticks/1.json
  def update
    @watchtick = Watchtick.find(params[:id])

    respond_to do |format|
      if @watchtick.update_attributes(params[:watchtick])
        format.html { redirect_to @watchtick, notice: 'Watchtick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @watchtick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watchticks/1
  # DELETE /watchticks/1.json
  def destroy
    @watchtick = Watchtick.find(params[:id])
    @watchtick.destroy

    respond_to do |format|
      format.html { redirect_to watchticks_url }
      format.json { head :no_content }
    end
  end
end
