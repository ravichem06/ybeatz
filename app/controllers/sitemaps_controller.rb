class SitemapsController < ApplicationController
  def sitemap
    redirect_to "https://s3-ap-southeast-1.amazonaws.com/#{ ENV['S3_BUCKET'] }/sitemaps/sitemap1.xml.gz"
    
  end
end