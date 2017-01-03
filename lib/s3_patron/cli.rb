require 'aws-sdk'
require 'thor'
module S3Patron
  class Cli < Thor
    include Setup
    desc "list", "List objects inside of a bucket"
    method_option :all, :type => :boolean, :default => false, :aliases => "-a",:desc => "List all buckets"
    method_option :limit, :type => :numeric, :default => 50, :aliases => "-l",:desc => "Set limit of items to display"
    def list
    end

    desc "upload" ,"Upload into a bucket"
    method_option :bucket, :type => :boolean, :default => false, :aliases => "-b",:desc => "Name of the bucket where you want to upload"
    def upload
    end

    desc "create" ,"create a bucket"
    def create
    end

    desc "download", "Download object from a bucket"
    def download
    end

    desc "buckets", "List all the buckets in S3 account"
    def buckets
    end
  end
end
