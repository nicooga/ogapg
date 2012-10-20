module ApplicationHelper

  def input_prepend(addon,input)
    row = content_tag :span, addon, :class => 'add-on'
    row += input
    content_tag :div, row, :class => 'input-prepend'
  end
    
  def file_uploader(name, img=nil)
    # If an img tag src is provided assume that the file exists
    c = img ? 'fileupload fileupload-exists' : 'fileupload fileupload-new'
    style = 'width: 250px; height: 188px;'
    
    content_tag :div, :class => c, 'data-provides' => 'fileupload', 'data-name' => name do
      string = content_tag :div, :class => 'fileupload-new thumbnail', :style => style do
        image_tag 'http://www.placehold.it/250x188/EFEFEF/AAAAAA&text=no+image', :style => style
      end
      
      string += content_tag :div, :class => 'fileupload-preview fileupload-exists' + (img ? ' thumbnail' : '' ), :style => style + ' line-height: 20px;' do
        image_tag img if img
      end

      string += content_tag :div do
        string2 = content_tag :span, :class => 'btn btn-file' do
          string3 = content_tag :span, 'Elegir Imagen', :class => 'fileupload-new'
          string3 += content_tag :span, 'Cambiar', :class => 'fileupload-exists'
          string3 += content_tag :input, nil, :type => 'file'
        end
        string2 += link_to 'Remover', '#', :class => 'btn fileupload-exists', 'data-dismiss' => 'fileupload'
      end
    end
  end

  def thumbnail(product,options={:size => 'span3'},&content)
    content_tag :li, :class => options[:size] do
      content_tag :div, :class => 'thumbnail' do
        string = image_tag product.image, :style => 'width: 300px; height: 200px;'
        string += content_tag :div, :class => 'caption' do
          string2 = content_tag :h3, product.name
          product.properties.find_all{|p| p.name == 'front'}.each do |ppty|
            string2 += content_tag :p, ppty.value, :style => 'margin: 0px;'
          end
          if product.properties.find_all{|p| p.name == 'front'}.length < 4
            (4 - product.properties.find_all{|p| p.name == 'front'}.length).times do
              string2 += content_tag :p, '&nbsp;'.html_safe , :style => 'margin: 0px;'
            end
          end
          string2 += content.call if block_given?
        end
      end
    end
  end

end