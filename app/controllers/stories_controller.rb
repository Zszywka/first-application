class StoriesController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index, :vote_up, :top10, :idea, :latest_stories]

  def index
    @stories = Story.page(params[:page]).per(3)
    if params[:category]
      @category = Category.find(params[:category])
      @stories = @stories.where(category_id: @category.id)
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

#HACK o_unlink failed · Issue #27 · diogob/carrierwave-postgresql
# blad generowany przez gema, usby go obejsc nalezy przechwici blad (info w notatkach)
  def destroy
    story = Story.find(params[:id])
    begin
      story.destroy
    rescue PG::Error => e
      raise if !e.message.include?("lo_unlink failed")
    end
    redirect_to stories_path
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    # HACK ned method `path' for 33366:Integer
    saved = begin
              @story.update(params_story)
            rescue NoMethodError => e
              if e.message.include?("undefined method `path' for")
                true
              else
                false
              end
            end
    if saved
      flash[:notice] = "The story was edited successfully"
      redirect_to @story
    else
      render "edit"
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
    params.require(:story).permit(:title, :author, :audio, :level, :picture, :category_id)
  end

  def idea
  end

end
