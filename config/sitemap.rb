# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.ybeatz.com"

SitemapGenerator::Sitemap.create_index = true
SitemapGenerator::Sitemap.public_path = 'public/sitemaps/'

SitemapGenerator::Sitemap.create do

  add contacts_path
  add communities_path, changefreq: 'weekly', priority: 0.9
  add profiles_path, changefreq: 'weekly'
  add members_path
  add new_member_session_path, priority: 0.0
  add new_member_registration_path, priority: 0.0


  Community.find_each do |post|
    add community_path(post.slug), lastmod: post.updated_at
  end
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
