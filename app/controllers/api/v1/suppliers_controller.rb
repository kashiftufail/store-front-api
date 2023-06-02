class Api::V1::SuppliersController < ApplicationController
  include CheckAdmin
  before_action :set_supplier, only: [:update, :show, :destroy]
  
  def index
    all_suppliers
  end

  def create    
    @supplier = Supplier.new(supplier_params)  
  
    if @supplier.save
      render json: searlizer_json(@supplier) , status: :created, location: api_v1_supplier_path(@supplier)
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end  
  
  def show
    render json: searlizer_json(@supplier)    
  end

  def update
    if @supplier.update(supplier_params)
      render json: searlizer_json(@supplier), location: api_v1_supplier_path(@supplier)
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end  
  end 
  
  def destroy
    
    if @supplier.destroy
      all_suppliers
    else
      render json: @supplier.errors
    end   
  end  
  
  private

  def all_suppliers
    suppliers = Supplier.includes(:books)
    render json: SupplierSerializer.new(suppliers).serializable_hash.to_json
  end  

  def searlizer_json(supplier)
    SupplierSerializer.new(supplier).serializable_hash.to_json
  end  

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end  

  def supplier_params
    params.require(:supplier).permit(:full_name)    
  end
end
