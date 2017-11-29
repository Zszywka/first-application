class WelcomeController < ApplicationController
  def index
    stories = Story.all
    if stories.any?
      array = stories.map {|story| story.id}  # [4,1,3,2]
      array = array.map {|id| id.to_s }.sort.reverse #["1", "2", "3", "4"]
      @stories = Story.find(array)
    end
  end
end
