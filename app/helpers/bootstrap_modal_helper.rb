module BootstrapModalHelper
  def bootstrap_modal_dialog(options = {}, escape = true, &block)
    default_options = {:class => 'bootstrap-modal modal hide fade'}
    content_tag :div, nil, options.merge(default_options), escape, &block
  end

  def bootstrap_modal_header(options = {}, escape = true, &block)
    default_options = {:class => 'modal-header'}
    content_tag :div, nil, options.merge(default_options), escape do
      content = content_tag(:button, '&times;'.html_safe, :class => 'close', 'data-dismiss' => 'modal')
      content << capture(&block)
    end
  end

  def bootstrap_modal_body(options = {}, escape = true, &block)
    default_options = {:class => 'modal-body'}
    content_tag :div, nil, options.merge(default_options), escape, &block
  end

  def bootstrap_modal_footer(options = {}, escape = true, &block)
    default_options = {:class => 'modal-footer'}
    content_tag :div, nil, options.merge(default_options), escape, &block
  end

  def bootstrap_modal_toggle(*args, &block)
    if block_given?
      options = args.first || {}
      description = capture(&block)
    else
      description = args.first
      options = args.second || {}
    end

    default_options = {:class => 'btn', 'data-toggle' => 'modal', 'href' => options[:dialog]}

    default_options.each do |key, value|
      options[key] = [default_options[key], options[key]].compact.join(' ')
    end

    content_tag :a, description, options
  end

  def bootstrap_modal_cancel_button(content, options = {})
    default_options = {:class => 'btn bootstrap-modal-cancel-button', 'data-dismiss' => 'modal'}

    content_tag 'a', content, default_options.merge(options)
  end
end

