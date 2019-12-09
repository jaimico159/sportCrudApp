# frozen_string_literal: true

class RegistrationFormsController < ApplicationController
  before_action :set_registration_form, only: %i[edit update destroy]

  # GET /registration_forms
  # GET /registration_forms.json
  def index
    @registration_forms = RegistrationForm.all
  end

  # GET /registration_forms/new
  def new
    @registration_form = RegistrationForm.new
  end

  # GET /registration_forms/1/edit
  def edit; end

  # POST /registration_forms
  # POST /registration_forms.json
  def create
    @registration_form = RegistrationForm.new(registration_form_params)

    respond_to do |format|
      if @registration_form.save
        format.html { redirect_to registration_forms_path, notice: 'Registration form was successfully created.' }
        format.json { render :index, status: :created, location: @registration_form }
      else
        format.html { render :new }
        format.json { render json: @registration_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registration_forms/1
  # PATCH/PUT /registration_forms/1.json
  def update
    respond_to do |format|
      if @registration_form.update(registration_form_params)
        format.html { redirect_to registration_forms_path, notice: 'Registration form was successfully updated.' }
        format.json { render :index, status: :ok, location: @registration_form }
      else
        format.html { render :edit }
        format.json { render json: @registration_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_forms/1
  # DELETE /registration_forms/1.json
  def destroy
    @registration_form.update(record_status: 'deleted')
    respond_to do |format|
      format.html { redirect_to registration_forms_url, notice: 'Registration form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_registration_form
    @registration_form = RegistrationForm.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def registration_form_params
    params.require(:registration_form).permit(:form_number, :partner_id, :sport_type_id, :record_status)
  end
end
