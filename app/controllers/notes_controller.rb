class NotesController < ApplicationController
  before_action :authenticate_user!
  def show
    @notes = current_user.notes
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
  
  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.content = params[:note][:content]
    if @note.save
      redirect_to root_path
    else
      render edit
    end
  end

  private

    def note_params
      params.require(:note).permit(:content, :picture)
    end
end
