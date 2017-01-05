require 'aws-sdk'
require 'thor'
require 'colorize'

module S3Patron
    class Cli < Thor
        desc 'list BUCKET_NAME REGION(OPTIONAL)', 'List objects inside of a bucket'
        method_option :all, type: :boolean, default: false, aliases: '-a', desc: 'List all items'
        method_option :limit, type: :numeric, default: 50, aliases: '-l', desc: 'Set limit of items to display'
        def list(bucket, region=ENV['AWS_REGION'])
          s3 = Aws::S3::Resource.new(region: region)
          bucket = s3.bucket(bucket)
          begin
              if options[:all]
                  puts "Showing all objects inside bucket named #{bucket.name}.".yellow
                  bucket.objects.each do |item|
                    puts item.key
                  end
              else
                  puts "Showing first #{options[:limit]} objects from #{bucket.name}.Use -a flag to show all objects".yellow
                  bucket.objects.limit(options[:limit]).each do |item|
                    puts item.key
                  end
              end
          rescue
              puts 'Something went wrong. Please try again.'.red
          end
        end

        desc 'upload BUCKET_NAME FILE REGION(OPTIONAL) PATH_TO_FILE', 'Upload into a bucket'
        method_option :bucket, type: :string, default: false, aliases: '-b', desc: 'Name of the bucket where you want to upload'
        def upload(bucket_name, file, region=ENV['AWS_REGION'])
          s3 = Aws::S3::Resource.new(region: region)
          begin
            item = file
            bucket = bucket_name
            name = File.basename(item)
            obj = s3.bucket(bucket).object(name)
            obj.upload_file(item)
            puts "#{file} successfully uploaded to #{bucket}".yellow
          rescue
            puts "Something went wrong. Please try again.".red
          end
        end

        desc 'create BUCKET_NAME REGION(OPTIONAL)', 'create a bucket'
        def create(bucket_name, region=ENV['AWS_REGION'])
            s3 = Aws::S3::Resource.new(region: region)
            s3.create_bucket(bucket: bucket_name.to_s)
            puts "#{bucket_name} successfully created.".yellow
        rescue Aws::S3::Errors::BucketAlreadyExists
            puts 'The requested bucket name is not available. The bucket namespace is shared by all users of the system. Please select a different name and try again.'.red
        rescue Aws::S3::Errors::InvalidBucketName
            puts "The specified bucket name is not a valid format based on AWS guidelines.\nFor more info please visit http://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html".red
        rescue Aws::S3::Errors::BucketAlreadyOwnedByYou
          puts "There is already an existing bucket with the same name".red
        end

        desc 'download BUCKET_NAME OBJECT DOWNLOAD_LOCATION(OPTIONAL) REGION(OPTIONAL)', 'Download object from a bucket'
        method_option :path, type: :string, default: false, aliases: '-p', desc: 'File path of location you want the file to be downloaded.'
        def download(bucket_name, item, path=Dir.pwd, region=ENV['AWS_REGION'])
          s3 = Aws::S3::Resource.new(region: region)
          obj = s3.bucket(bucket_name).object(item)
          obj.get(response_target: "#{path}/#{obj.key}")
        end

        desc 'buckets REGION(OPTIONAL)', 'List all the buckets in S3 account'
        method_option :all, type: :boolean, default: false, aliases: '-a', desc: 'List all Items'
        method_option :limit, type: :numeric, default: 50, aliases: '-l', desc: 'Set limit of items to display'
        def buckets(region=ENV['AWS_REGION'])
            s3 = Aws::S3::Resource.new(region: region)
            begin
                if options[:all]
                    puts 'Showing all buckets.'.yellow
                    s3.buckets.each do |b|
                        puts b.name.to_s
                    end
                else
                    puts "Showing first #{options[:limit]} buckets.Use -a flag to show all listings".yellow
                    s3.buckets.limit(options[:limit]).each do |b|
                        puts b.name.to_s
                    end
                end
            rescue
                puts 'Something went wrong. Please try again.'.red
            end
        end
    end
end
