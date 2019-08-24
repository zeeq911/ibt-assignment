class NotesController < ApplicationController
  before_action :authenticate_user!
  def index
    shared_notes_ids = "SELECT note_id FROM shared_notes WHERE  user_id = :user_id"
    @notes = Note.where("id IN (#{shared_notes_ids}) OR user_id = :user_id", user_id: current_user.id)
  end

  def show
    @note = Note.find(params[:id]) 
  end

  def new
    @notes = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      flash[:danger] = "Content cannot be empty!"
      new
    end
  end

  def destroy
    if current_user.notes.destroy(params[:id])
      redirect_to root_path
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.content = params[:note][:content]
    if @note.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def share
    user_email = params[:shared_note][:email]
    note_error = "cant share notes you created with yourself"
    if(user_email != current_user.email)
      @reciver = User.find_by(email: user_email.to_s)
      note_error = "reciver email does not exist"
      if !@reciver.nil?
        @reciver_id = @reciver.id
        @shared_note = SharedNote.new(note_id: params[:id], user_id: @reciver_id)
        note_error = "note is already shared with this user"
        if @shared_note.save
          redirect_to root_path
          return
        else
          render 'edit'
          return
        end
      else
      end
    end 
    @note = Note.find(params[:id])
    @note.errors.add(:base, note_error)
    render 'edit'
  end

  private

    def note_params
      params.require(:note).permit(:content, :picture)
    end
    def note_share_params
      params.permit( :shared)
    end
end
