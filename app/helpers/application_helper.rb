# frozen_string_literal: true

module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new

    fields = f.fields_for(association, new_object, child_index: new_object.object_id) do |builder|
      render("#{association.to_s.singularize}_fields", f: builder)
    end

    link_to(name, '#', class: 'add_fields', data: { id: new_object.object_id, fields: fields.gsub("\n", '') })
  end

  def prev_page_btn
    return if current_page.zero? || current_page == 1

    link_to('<', { controller: controller_name, action: action_name,  page: current_page - 1 },
            class: 'btn btn-success')
  end

  def next_page_btn
    link_to('>', { controller: controller_name, action: action_name,  page: current_page + 1 },
            class: 'btn btn-success')
  end

  def current_page
    params[:page].to_i
  end
end
