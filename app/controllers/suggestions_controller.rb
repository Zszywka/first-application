class SuggestionsController < ApplicationController

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(params_suggestion)
    if @suggestion.save
      flash[:notice] = "Twoja propozycja została wysłana"
      redirect_to suggestions_path
    else
      render "new"
    end
  end

  def index
    @suggestions = Suggestion.all
  end

  def destroy
    suggestion = Suggestion.find(params[:id])
    suggestion.destroy
    redirect_to suggestions_path
  end

  private
  
  def params_suggestion
    params.require(:suggestion).permit(:body, :author)
  end

end
