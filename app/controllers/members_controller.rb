class MembersController < ApplicationController

  def index
    # if params[:query].present?
    #   sql_query = "name ILIKE :query"
    #   @members = Member.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @members = Member.last(10)
    # end
    if params[:query]
      @members = Member.search_by_member(params[:query]).reorder('members.name ASC')
    else
      @members = Member.last(10)
    end

  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      if params[:member][:ship_id].present?
        redirect_to new_ship_crew_path(params[:member][:ship_id], selected_member_id: @member.id)
        # a linha acima passa, além dos parâmetros ship e member, uma variável selected_member_id: @member.id para ser utilizada na view
      else
        redirect_to member_path(@member), notice: 'Member was successfully created.'
      end
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
