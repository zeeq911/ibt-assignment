class NotesController < ApplicationController
  before_action :authenticate_user!
  def show
    @notes = Note.all
  end
  
  def new
    render html: "Hi"
  end
end
