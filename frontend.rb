gem "high_voltage"
route "root :to => 'high_voltage/pages#show', :id => 'home'"

run "rm -R public/index.html app/mailers app/models app/views/layouts/application.html.erb"

repo = 'https://raw.github.com/stgeneral/rails-templates/master/files/'
repo = File.expand_path(File.dirname(__FILE__) + '/files') + '/' if yes?('Would you like to use local repository?')

files = [{
    name: 'application.html.erb',
    path: 'app/views/layouts/'
  }, {
    name: 'build.rake',
    path: 'lib/tasks/'
  }, {
    name: 'build.rb',
    path: 'config/environments/'
  }, {
    name: 'home.html.erb',
    path: 'app/views/pages/'
  }]

files.each do |f|
  get repo + f[:path] + f[:name], f[:path] + f[:name]
  gsub_file f[:path] + f[:name], /APP_NAME/, "#{app_name.humanize.titleize}"
end

pages = ask("What pages would you like to generate (lower case, '_' as word delimiter, ' ' as pages delimiter)?")
pages_links = ''
pages.split(' ').each do |page|
  page_file = "app/views/pages/#{page}.html.erb"
  get repo + "app/views/pages/page.html.erb", page_file
  gsub_file page_file, /PAGE_TITLE/, page.humanize.titleize
  gsub_file page_file, /PAGE/, page
  pages_links += "\t<li><%= link_to '#{page.humanize.titleize}', page_path('#{page}') %></li>\n"
end

get repo + 'app/views/partials/_pages.html.erb', 'app/views/partials/_pages.html.erb'
gsub_file 'app/views/partials/_pages.html.erb', /PAGES_LINKS/, pages_links
