class CustomersController < ApplicationController

   include Utility

  def new
    @customer = Customer.new
    @customer.phone = generate_number
  end

  def verify
    @phone_no = ContactBook.find_by(phone: params[:phone])
    
    flash_message = @phone_no.present? ? { notice: "Phone number is already present in the database." } : { alert: "Phone number is not present in the database." }
    
    redirect_to new_customer_path, flash: flash_message
  end

  def create
    @service_provider = current_user.service_provider
    @customer = @service_provider.customers.build(customer_params.merge(user_id: current_user.id))

    if @customer.save
      @address = @customer.addresses.new(address_params)
      @address.save

      @contact = @customer.contact_books.new(phone: params[:phone])
      @contact.save
      
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @customer = Customer.all 
    @customer_details = @customer.includes([:addresses],[:contact_books])
     render :index
  end


  def show 
     @customer = Customer.find(params[:id])
  end


   private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :aadhar_number, :aadhar_image)
    end

    def address_params
       params.require(:customer).permit(:address, :city)
    end

    # def contact_params
    #    params.require(:customer).permit(:phone)
    # end
end
