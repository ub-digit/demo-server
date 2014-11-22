class DemosController < ApplicationController
  def index
    demos = Demo.all
    render json: {demos: demos}
  end

  def show
    demo = Demo.find(params[:id])
    render json: {demo: demo}
  end

  def create
    demo = Demo.new(params_permitted)
    if demo.save
      render json: {demo: demo}
    else
      render json: {errors: demo.errors}, status: 422
    end
  end

  def update
    demo = Demo.find(params[:id])
    if demo.update_attributes(params_permitted)
      render json: {demo: demo}
    else
      render json: {errors: demo.errors}, status: 422
    end
  end

  def destroy
    demo = Demo.find_by_id(params[:id])
    if !demo
      render json: {}, status: 404
    else
      if demo.destroy
        render json: {}
      end
    end
  end

  private

  def params_permitted
    params.require(:demo).permit(:title, :summary, :body, :url)
  end
end
