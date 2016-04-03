class SearchesController < ApplicationController
  before_action :set_search, only: [:create]

  def results
    # Direct connection
    solr = RSolr.connect :url => 'http://localhost:8983/solr/tech_news_index/'

    # send a request to /select
    @query = params.require(:query)
    @response = solr.get 'select', :params => {:q => @query}
    @docs = @response["response"]["docs"]
  end

  def new
    @search = Search.new
  end

  def create
    redirect_to searches_results_path @query
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @query = params.require(:search).permit(:query)
    end
end
