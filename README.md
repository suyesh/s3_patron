# S3-Patron - Command-line utility for S3 written in Ruby
![S3](https://cdn.foliovision.com/images/edd/2016/05/amazon-s3-icon1.png)

S3-Patron lets you list, upload, download to and from s3 using your terminal


## Setup
Make sure [Ruby](https://www.ruby-lang.org/en/documentation/installation/) is installed.

Add this line to your application's Gemfile:
```
    $ gem install s3_patron
```

Set ENV variables

```
    $ export AWS_ACCESS_KEY_ID="YOUR AWS ACCESS KEY"
    $ export AWS_SECRET_ACCESS_KEY="YOUR AWS SECERET KEY"
    $ export AWS_REGION="AWS REGION"
```

## Usage

```
Commands:
  s3patron buckets REGION(OPTIONAL)                                                  # List all buckets
  s3patron create BUCKET_NAME REGION(OPTIONAL)                                       # create bucket
  s3patron download BUCKET_NAME OBJECT DOWNLOAD_LOCATION(OPTIONAL) REGION(OPTIONAL)  # Download object from bucket
  s3patron help [COMMAND]                                                            # Describe Commands
  s3patron list BUCKET_NAME REGION(OPTIONAL)                                         # List objects inside bucket
  s3patron upload BUCKET_NAME FILE REGION(OPTIONAL) PATH_TO_FILE                     # Upload into bucket

```

##Rubygems.org
Hosted at [Rubygems.org](https://rubygems.org/gems/s3_patron)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
