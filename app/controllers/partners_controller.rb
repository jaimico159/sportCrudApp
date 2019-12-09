# frozen_string_literal: true

class PartnersController < ApplicationController
  before_action :set_partner, only: %i[show edit update destroy]

  # GET /partners
  # GET /partners.json
  def index
    (@filterrific = initialize_filterrific(
      Partner,
      params[:filterrific]
    )) || return
    @partners = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /partners/new
  def new
    @partner = Partner.new
  end

  # GET /partners/1/edit
  def edit; end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.html { redirect_to partners_path, notice: 'Partner was successfully created.' }
        format.json { render :index, status: :created, location: partners_path }
      else
        format.html { render :new }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1
  # PATCH/PUT /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to partners_path, notice: 'Partner was successfully updated.' }
        format.json { render :index, status: :ok, location: partners_path }
      else
        format.html { render :edit }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    if @partner.registration_forms.count > 0
      respond_to do |format|
        format.html { redirect_to partners_path, alert: 'This Partner cannot be deleted as registration forms are attached to it' }
      end
      return
    end

    if @partner.destroy
      respond_to do |format|
        format.html { redirect_to partners_url, notice: 'Partner was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to partners_url, alert: 'Can\'t delete Partner.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_partner
    @partner = Partner.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def partner_params
    params.require(:partner).permit(:code, :name, :record_status)
  end
end
