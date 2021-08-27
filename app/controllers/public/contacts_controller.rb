class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @contact.invalid?
      render :action => 'confirm'
    end
  end

  def back
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    render :new
  end

  def create
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      render :action => 'done'
    else
      render :new
    end
  end

  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :phone_number, :subject, :message)
  end
end
