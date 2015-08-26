class MedicinesController < ApplicationController
    before_action :required_params

    def index

    end

    def create
        new_line = Medicine.new
        new_line.save
        render_table
    end

    def delete
        to_delete = params[:id]
        begin
            Medicine.destroy(to_delete)
            render_table
        rescue 
            render :index
        end
    end     

    def update
        to_save = params[:medicine]
        begin
            to_save.each do |k,v|
                med = Medicine.find(k)
                to_save[k].each do |v|
                    col = v[0]
                    value = v[1]
                    med.send("#{col}=",value) if med.send("#{col}").blank? || value != ""
                end
                med.save
            end
            render :index
        rescue
            flash[:danger] = "Não foi possivel salvar, tente novamente"
            redirect_to medicamentos_path
        end
    end

    private
    def required_params
        @save_medicines = Medicine.new
        @medicines = Medicine.all
    end

    private 
    def render_table
        respond_to do |format|
            format.html { redirect_to medicamentos_url }
            format.json { head :no_content }
            format.js   { render :layout => false }
        end
    end
end
