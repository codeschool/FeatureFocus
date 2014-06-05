class SearchController < ApplicationController
  def index
    keyword = params[:keyword]

    if project = Project.find_by(title: keyword)
      redirect_to project
    elsif user = User.find_by(name: keyword)
      redirect_to user
    else
      @results = Search.for(keyword)
    end

  end
end
