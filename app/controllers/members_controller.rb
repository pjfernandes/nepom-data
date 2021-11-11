class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
    @member = Member.new()
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to member_path(@member), notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  def show
    @member = Member.find(params[:id])
    @type = 'member'
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member)
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path
  end

  def delete_image_attachment
    @member = Member.find(params[:id])
    @member.photo.purge
    # redirect_to ship_path(@ship)
    redirect_to edit_member_path(@member)
  end

  private

  def member_params
    params.require(:member).permit(:name, :CPF, :birth, :license_number, :doc_number, :doc_type, :photo)
  end

end
