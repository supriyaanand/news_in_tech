require 'spec_helper'

describe SearchesController, :type => :controller do
  let(:keyword) { 'abc' }

  context '#results' do
    it 'returns empty result when none of the documents match with the query keyword' do
      get :results, query: keyword
      expect(assigns(:response)).not_to be_empty
      expect(assigns(:docs)).to be_empty
    end
  end
end

