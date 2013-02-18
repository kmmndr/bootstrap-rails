module BootstrapTabHelper
  def bootstrap_tab_for(*args, &block)
    if block_given?
      options = args.first || {}
      description = capture(&block)
    else
      description = args.first
      options = args.second || {}
    end

    tabs = options[:tabs] || :default
    tabs = tabs.to_s.downcase.parameterize.to_sym unless tabs.is_a? Symbol
    active = options[:active] || false
    klass = options[:class] || nil

    # prepare tabs hash
    @bootstrap_tabs = {} if @bootstrap_tabs.nil?
    @bootstrap_tabs[tabs] = [] if @bootstrap_tabs[tabs].nil?

    index = @bootstrap_tabs[tabs].count
    title = options[:title] || ''
    tab_hash = { :index => index, :active => active, :title => title, :description => description, :class => klass }

    @bootstrap_tabs[tabs] << tab_hash

    nil
  end

  def bootstrap_tabs(options = {}, &block)
    tabs = options[:tabs] || :default
    id = options[:id] || tabs.to_s

    unless @bootstrap_tabs.nil?
      tabs_array = @bootstrap_tabs[tabs]

      tabs_content = html_comments 'bootstrap_tabs'
      tabs_content << content_tag(:ul, :class => 'nav nav-tabs', :id => id, :data => { :tabs => 'tabs' }) do
        tab_content = ''.html_safe

        tabs_array.each do |tab|
          tab_id = "tab_#{tabs.to_s}_#{tab[:index]}"
          tab_klass = tab[:class]

          li_html_options = {}
          li_html_options = { :class => 'active' } if tab[:active]

          tab_content << content_tag(:li, li_html_options) do
            link_html_options = { :data => { :toggle => 'tab' }, :id => "toggle_#{tab_id}" }
            link_html_options[:class] = tab_klass unless tab_klass.nil?
            link_to tab[:title], "##{tab_id}", link_html_options
          end
        end

        tab_content
      end

      tabs_content << content_tag(:div, :class => 'tab-content') do
        tab_content = ''.html_safe
        tabs_array.each do |tab|
          klass = ['tab-pane']
          klass << 'active' if tab[:active]

          tab_content << content_tag(:div, :class => klass.join(' '), :id => "tab_#{tabs.to_s}_#{tab[:index]}") do
            tab[:description]
          end
        end

        tab_content
      end

      tabs_content
    end
  end

end
