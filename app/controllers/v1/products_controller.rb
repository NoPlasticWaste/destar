class V1::ProductsController < ApplicationController
	def index
		products = Product.all
		render json: products, status: :ok
	end

	def create
		products = Product.new(product_params)

		if products.save
			render json: products, status: :ok
		else
			render json: { errors: products.errors}, status: :unprocessable_entity
		end
	end

	def show
		products = Product.find(params[:id])
		render json: products, status: :ok
	end

	def update
		products = Product.find(params[:id])

		if products.update(product_params)
			render json: products, status: :ok
		else
			render json: { errors: products.errors}, status: :unprocessable_entity
		end
	end

	def destroy
		products = Product.find(params[:id])
		products.destroy
		head 204
	end

	private
	
	def product_params
		params.require(:product).permit(:name)
	end
end