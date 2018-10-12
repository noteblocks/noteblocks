# frozen_string_literal: true

class BlocksController < ApplicationController
  before_action :set_notebook
  before_action :set_block, only: %i[show update destroy]

  # GET /notebooks/:notebook_id/blocks
  def index
    json_response(@notebook.blocks)
  end

  # POST /notebooks/:notebook_id/blocks
  def create
    @block = @notebook.blocks.create!(permitted_params)
    json_response(@block, :created)
  end

  # GET /notebooks/:notebook_id/blocks/:id
  def show
    json_response(@block)
  end

  # PUT /notebooks/:notebook_id/blocks/:id
  def update
    @block.update(permitted_params)
    head :no_content
  end

  # DELETE /notebooks/:notebook_id/blocks/:id
  def destroy
    @block.destroy
    head :no_content
  end

  private

  def permitted_params
    # whitelist params
    params.permit(:name, :data, :schema_version)
  end

  def set_notebook
    @notebook = Notebook.find(params[:notebook_id])
  end

  def set_block
    @block = @notebook.blocks.find(params[:id])
  end
end
