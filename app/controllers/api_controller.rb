# frozen_string_literal: true

class ApiController < ApplicationController
  def index
    render json: {
      collection: serialized_collection,
      total_count: collection.total_count,
      current_page: collection.current_page,
      total_pages: collection.total_pages
    }
  end

  def show
    render json: show_serializer.new(resource).as_json
  end

  private

  def serialized_collection
    ActiveModel::SerializableResource.new(
      collection,
      each_serializer: index_serializer
    )
  end

  def collection
    model.includes(relations).page(page)
  end

  def relations
    []
  end

  def page
    return 1 if params[:page].blank?

    params[:page].to_i
  end

  def resource
    model.find(params[:id])
  end

  def index_serializer
    "#{model}s::IndexSerializer".constantize
  end

  def show_serializer
    "#{model}s::ShowSerializer".constantize
  end
end
