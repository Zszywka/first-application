# require "byebug"
class StoriesController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index, :vote_up, :top10]


  def index
      # stronicowanie za pomoca kaminari
    @stories = Story.page(params[:page]).per(2)
    if params[:category]
      @category = Category.find(params[:category])
      @stories = @category.stories
      # Story.where(category_id: params[:category])
    end

    @order = params[:order] || "title"
    @dir = params[:dir] || "desc"
    if %w(title author level).include?(@order)
      @stories = @stories.order(@order => @dir)
    end

    @text = params[:text]
    if @text
      @stories = @stories.where("title ilike :text or author ilike :text or level ilike :text", text: "%#{@text}%" )
    end

    if params[:level]
      @story = Story.which_level(params[:level])
    end
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params_story)

    if @story.save
      flash[:notice] = "The story was added successfully"
      redirect_to stories_path
    else
      render "new"
    end
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy

    redirect_to stories_path
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(params_story)
      flash[:notice] = "The story was edited successfully"
      redirect_to @story
    else
       "edit"
    end
  end

  def show
    @story = Story.find(params[:id])
    @stories = Story.all
  end

  def vote_up
    @story = Story.find(params[:id])
    if session[:votes] && session[:votes].include?(@story.id)
      flash[:notice] = "Już głosowałeś!"
    else
      @story.rate += 1
      @story.save!
      session[:votes] ||= []
      session[:votes] << @story.id
    end

    redirect_to story_path(@story)
  end

  def top10
    @stories = Story.order("rate DESC").limit(10)
  end

  def latest_stories
    @stories = Story.order("id desc").limit(5)
  end

  def the_same_author
    @stories = Story.all
    @story = Story.find(params[:id])
  end

  private

  def params_story
    params.require(:story).permit(:title, :author, :file, :level, :picture, :category_id)
  end

  def idea
  end

end
