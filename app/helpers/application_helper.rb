module ApplicationHelper
  def input_prepend(addon,input)
    row = content_tag :span, addon, :class => 'add-on'
    row += input
    content_tag :div, row, :class => 'input-prepend'
  end
    
  def image_tag (src)
    tag :img, :src => src
  end

  def file_uploader(name, img=nil)
    # If an img tag src is provided assume that the file exists
    c = img ? 'fileupload fileupload-exists' : 'fileupload fileupload-new'
    style = 'width: 200px; height: 150px;'
    
    content_tag :div, :class => c, 'data-provides' => 'fileupload', 'data-name' => name do
      string = content_tag :div, :class => 'fileupload-new thumbnail', :style => style do
        image_tag 'http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image'
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

end