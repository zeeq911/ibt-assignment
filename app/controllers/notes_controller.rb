class NotesController < ApplicationController
  def show
    @notes = Note.all
  end
  def new
  end
end
