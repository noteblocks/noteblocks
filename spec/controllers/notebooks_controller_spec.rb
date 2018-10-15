require 'rails_helper'

RSpec.describe NotebooksController, type: :request do
  # initialize test data
  let!(:notebooks) { create_list(:notebook, 10) }
  let!(:notebook_id) { notebooks.first.id }

  describe 'GET /notebooks' do
    before { get '/notebooks' }

    it 'returns notebooks' do
      expect(response.parsed_body).not_to be_empty
      expect(response.parsed_body.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /notebooks' do
    # valid payload
    let(:valid_attributes) { { name: 'Test Notebook', desc: 'Test Desc' } }

    context 'when the request is valid' do
      before { post '/notebooks', params: valid_attributes }

      it 'creates a notebook' do
        expect(response.parsed_body['name']).to eq('Test Notebook')
        expect(response.parsed_body['desc']).to eq('Test Desc')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/notebooks', params: { name: nil } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'GET /notebooks/:id' do
    before { get "/notebooks/#{notebook_id}" }

    context 'when the record exists' do
      it 'returns the notebook' do
        expect(response.parsed_body).not_to be_empty
        expect(response.parsed_body['id']).to eq(notebook_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:notebook_id) { Notebook.last.id + 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Notebook/)
      end
    end
  end

  describe 'PUT /notebooks/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/notebooks/#{notebook_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /notebooks/:id' do
    before { delete "/notebooks/#{notebook_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
