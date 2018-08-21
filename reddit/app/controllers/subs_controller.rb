class SubsController < ApplicationController
  before_action :require_login

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new 
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to edit_sub_url(@sub)
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:title, :destription)
  end
end
