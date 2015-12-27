###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Get Bower to play nice with Middleman
after_configuration do
  sprockets.append_path File.join root, 'bower_components'
end

# Configure asset directories
set :fonts_dir, 'assets/fonts'
set :images_dir, 'assets/images'
set :js_dir, 'assets/javascripts'
set :css_dir, 'assets/stylesheets'
set :layouts_dir, 'layouts'

# Use relative links
activate :relative_assets
set :relative_links, true
set :relative_paths, true

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

activate :blog do |blog|
  blog.layout = 'post'
  blog.permalink = 'blog/{title}'
  blog.sources = 'posts/{year}-{month}-{day}-{title}'
  # blog.taglink = 'tags/{tag}.html'
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 150
  # blog.year_link = '{year}.html'
  # blog.month_link = '{year}/{month}.html'
  # blog.day_link = '{year}/{month}/{day}.html'
  # blog.default_extension = '.markdown'

  blog.tag_template = 'tag.html'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 9
  blog.page_link = '{num}'

  blog.custom_collections = {
    category: {
      link: '/category/{category}.html',
      template: 'category.html'
    }
  }
end

page "/feed.xml", layout: false

# Methods defined in the helpers block are available in templates
helpers do
  def build_categories(articles)
    categories = []
    articles.each do |article|
      category = article.data.category
      categories.push(category) unless categories.include? category
    end
    return categories
  end
end

# Pretty URLs
activate :directory_indexes

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
