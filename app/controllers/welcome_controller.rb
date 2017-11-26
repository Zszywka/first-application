class WelcomeController < ApplicationController

  def index
    stories = Story.all
    array = stories.map {|story| story.id}
    @story1 = Story.find(array.last)
    @story2 = Story.find((array.last(2)).first)
    @story3 = Story.find((array.last(3)).first)
    @story4 = Story.find((array.last(4)).first)
    @story5 = Story.find((array.last(5)).first)
    @story6 = Story.find((array.last(6)).first)
  end

end
