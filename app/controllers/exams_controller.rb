class ExamsController < ApplicationController

  before_action :logged_in_user

  def create
    exam_params

    cliente_id = params[:format]
    @exam = Exam.new(params[:exam]) do |e|
      if params[:exam][:data]
        e.data        = params[:exam][:data].read
        e.filename    = params[:exam][:data].original_filename
        e.description = params[:exam][:description]
        e.mime_type   = params[:exam][:data].content_type
        e.cliente_id  = cliente_id
      end
    end
    
    if @exam.save!
      flash[:success] = "Exame salvo com sucesso"
      redirect_to(cliente_path(cliente_id))
    else
      flash[:success] = "Ocorreu um erro ao salvar o exame"
      redirect_to(cliente_path(cliente_id))
    end
    
  end

  def serve
    params.require(:id)
    
    @exam = Exam.find(params[:id])
    send_data(@exam.data, :type => @exam.mime_type, :filename => @exam.filename, :disposition => "inline")
  end

  private
  def exam_params
      params.require(:exam).permit!
      params.require(:format)
  end
end
