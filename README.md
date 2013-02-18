# Twitter Bootstrap v2.2.2.0 for Rails 3/4
Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites.
It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.

Note: if you are looking for bootstrapped date and time pickers please take a look at [anjlab-widgets](https://github.com/anjlab/anjlab-widgets) gem.


anjlab-bootstrap-rails project integrates Bootstrap CSS (with Sass flavour) and JS toolkits for Rails 3 projects

## Rails > 3.1
Include Bootstrap in Gemfile;

``` ruby
gem 'anjlab-bootstrap-rails', '>= 2.2', :require => 'bootstrap-rails'
```

or you can install from latest build;

``` ruby
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :git => 'git://github.com/anjlab/bootstrap-rails.git'
```

and run bundle install.

## Stylesheets

Add necessary stylesheet file to app/assets/stylesheets/application.css

``` css
*= require twitter/bootstrap
```

You can override bootstrap variables:

 1. replace `*= require twitter/bootstrap` with `*= require app_bootstrap`
 2. create `app_bootstrap.css.scss` :

```scss
// change colors
$linkColor: red;

// change grid
$gridColumnWidth: 70px;
$gridGutterWidth: 10px;

// import original bootstrap
@import "twitter/bootstrap";
@import "twitter/bootstrap-responsive";
```
 NOTE: restart `pow` if you are using it.

## Javascripts

Add necessary javascript(s) files to app/assets/javascripts/application.js

``` javascript
// Include all twitter's javascripts
//= require twitter/bootstrap

// Or peek any of them yourself
//= require twitter/bootstrap/transition
//= require twitter/bootstrap/alert
//= require twitter/bootstrap/modal
//= require twitter/bootstrap/dropdown
//= require twitter/bootstrap/scrollspy
//= require twitter/bootstrap/tab
//= require twitter/bootstrap/tooltip
//= require twitter/bootstrap/popover
//= require twitter/bootstrap/button
//= require twitter/bootstrap/collapse
//= require twitter/bootstrap/carousel
//= require twitter/bootstrap/typeahead
//= require twitter/bootstrap/affix
```

## Helpers

To simplify bootstrap usage, this gem include some helpers for the following features :

  - flash block
  - glyph
  - modal
  - tab

### Flash helpers


You may add flash message manually by adding such lines in your controller.

```
flash[:message] = "Hello message"
flash[:notice] = "Hello notice"
```

The flash helper render flash messages using bootstrap, place it somewhere on your layout view.

```
<%= bootstrap_flash %>
```

### Glyph helpers

Bootstrap includes [Glyphicons](http://glyphicons.com/).
Glyph helper lets you add icon as easily as :

```
<%= bootstrap_glyph(:share_alt) %>
```

As well as for the white version :

```
<%= bootstrap_glyph(:lock, :white) %>
```

For a complete list of icons available, see `scss/sprites.css` file in the following bootstrap repo [Sass repo](https://github.com/yury/bootstrap/).

### Modal helpers

```
<%= bootstrap_modal_toggle(:dialog => '#toto') do %>
  Toggle toto
<% end %>

<%= bootstrap_modal_dialog(:id => 'toto') do %>
  <%= bootstrap_modal_header do %>
    header de la modal
  <% end %>
  <%= bootstrap_modal_body do %>
    toto
    <%= bootstrap_modal_cancel_button 'CLOSE' %>
  <% end %>
  <%= bootstrap_modal_footer do %>
    footer de la modal
  <% end %>
<% end %>
```

### Tab helpers


```
<%= bootstrap_tab_for(:tabs => :property, :title => t('attributes.property.geoloc'), :class => 'toto') do %>
  ...
<% end %>

<%= bootstrap_tabs(:tabs => :property) %>
```

## Upgrade notes from 1.4

 - [Twitter Bootstrap Upgrade](http://twitter.github.com/bootstrap/upgrading.html)
 - rm -rf tmp/cache

## For Developers

 - Fork this repo if you want fix rails integration bug
 - Fork [Sass repo](https://github.com/yury/bootstrap) if you want fix SASS bug
        
## Thanks
Thanks Twitter for Bootstrap
http://twitter.github.com/bootstrap

Inspired by Seyhun Akyürek and his [twitter-bootstrap-rails gem](https://github.com/seyhunak/twitter-bootstrap-rails)


## License
Copyright (c) 2012 AnjLab

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
