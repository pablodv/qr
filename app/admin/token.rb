ActiveAdmin.register Token do
  config.batch_actions = false

  filter :code

  index do
    column :id
    column :code
    column("QR code"){ |token| image_tag token.qr_code.url, size: "75x75" }
    actions
  end

  form do |f|
    f.inputs "" do
      f.input :code, input_html: { readonly: true }, hint: link_to("Generate Token", "", id: "token").html_safe
    end

    f.actions
  end

  permit_params :code
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
