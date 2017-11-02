crumb :root do
  link "Home", root_path
end

crumb :profile do |user|
  link 'Profile', user_path(user)
  parent :root
end

crumb :articles do |user|
  link "#{user.screen_name}\'s articles", user_articles_path(user)
  parent :profile, user
end

crumb :article do |user, article|
  link article.title, user_article_path(user, article)
  parent :articles, user
end

crumb :new_article do |user|
  link 'New article', user_articles_path(user)
  parent :articles, user
end

crumb :edit_article do |user, article|
  link 'Edit article', edit_user_article_path(user, article)
  parent :articles, user
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
