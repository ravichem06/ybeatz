require 'aws'

namespace :sitemap do
  desc 'Upload the sitemap files to S3'
  task upload_to_s3: :environment do
    s3 = AWS::S3.new(
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      :s3_endpoint => 's3-ap-southeast-1.amazonaws.com'
    )
    bucket = s3.buckets[ENV['S3_BUCKET']]
    Dir.entries(File.join(Rails.root, "public", "sitemaps")).each do |file_name|
      next if ['.', '..'].include? file_name
      path = "sitemaps/#{file_name}"
      file = File.join(Rails.root, "public", "sitemaps", file_name)
 
      begin
        object = bucket.objects[path]
        object.write(file: file)
      rescue Exception => e
        raise e
      end
      puts "Saved #{file_name} to S3"
    end
  end
end

namespace :sitemap do
  # ...
  desc 'Create the sitemap, then upload it to S3 and ping the search engines'
  task create_upload_and_ping: :environment do
    Rake::Task["sitemap:create"].invoke

    Rake::Task["sitemap:upload_to_s3"].invoke

    SitemapGenerator::Sitemap.ping_search_engines('http://www.ybeatz.com/sitemap.xml.gz')
  end
end