require 'rails_helper'

RSpec.describe BlocksController, type: :request do
  before(:each) do
    @notebook = create(:notebook)
    @block = create(:block, notebook: @notebook)
    @block2 = create(:block, notebook: @notebook)
  end

  describe 'GET /notebooks/:notebook_id/blocks' do
    before { get "/notebooks/#{@notebook.id}/blocks" }

    it 'returns blocks' do
      expect(response.parsed_body).not_to be_empty
      expect(response.parsed_body.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /notebooks/:notebook_id/blocks/:id' do
    before { get "/notebooks/#{@notebook.id}/blocks/#{@block.id}" }

    context 'when the record exists' do
      it 'returns the block_id' do
        expect(response.parsed_body).not_to be_empty
        expect(response.parsed_body['id']).to eq(@block.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get "/notebooks/#{@notebook.id}/blocks/#{@block.id + 100}" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Block/)
      end
    end
  end

  describe 'POST /notebooks/:notebook_id/blocks' do
    # valid payload
    let(:valid_attributes) do
      { name: 'Test Block',
        data: { "test" => "this is test" }.to_json,
        schema_version: "v1" }
    end

    context 'when the request is valid' do
      before { post "/notebooks/#{@notebook.id}/blocks", params: valid_attributes }

      it 'creates a notebook' do
        expect(response.parsed_body['name']).to eq('Test Block')
        expect(response.parsed_body['data']).to eq({ "test" => "this is test" }.to_json)
        expect(response.parsed_body['schema_version']).to eq('v1')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/notebooks/#{@notebook.id}/blocks", params: { name: nil } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /notebooks/:notebook_id/blocks/:id' do
    let(:valid_attributes) do
      { data: { "test" => "this is test" } }
    end

    context 'when the record exists' do
      before { put "/notebooks/#{@notebook.id}/blocks/#{@block.id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /notebooks/:notebook_id/blocks/:id' do
    before { delete "/notebooks/#{@notebook.id}/blocks/#{@block.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
