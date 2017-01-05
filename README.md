# S3-Patron - Command-line utility for S3 written in Ruby
![S3](https://cdn.foliovision.com/images/edd/2016/05/amazon-s3-icon1.png)

S3-Patron lets you list, upload, download to and from s3 using your terminal


## Setup
Make sure [Ruby](https://www.ruby-lang.org/en/documentation/installation/) is installed.

Execute:
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

```shell
#List of Commands:
$ s3patron buckets [REGION(OPTIONAL)]   # List all buckets
$ s3patron create [BUCKET_NAME] [REGION(OPTIONAL)]  # create bucket
$ s3patron download [BUCKET_NAME] [OBJECT] [DOWNLOAD_LOCATION(default=CURRENT DIR)] [REGION(default=ENV[AWS_REGION])] # Download object from bucket
$ s3patron help [COMMAND] # Describe Commands
$ s3patron list [BUCKET_NAME] [REGION(OPTIONAL)] # List objects inside bucket
$ s3patron upload [BUCKET_NAME] [FILE] [REGION(OPTIONAL)] # Upload into bucket

```

#Examples

##List Buckets

```shell
#Normal
$ s3patron buckets
# Will list all buckets in your s3. By default it lists first 50 items

$ s3patron buckets -a
# passing -a flag will list all items with no limit.

$ s3patron buckets -l 10 #will show first 10 buckets
# You can customize number of results by passing -l flag followed by limit
```

##Create Bucket

```shell
#Normal
$ s3patron create example_bucket
# Will create a bucket named example_bucket

#Optional
# If you do not want to use the AWS REGION defined in env variables you can pass region as next argument to create
$ s3patron create example_bucket us-east-1
```

##List Objects inside the bucket

```shell
#Normal
$ s3patron list example_bucket
# Will list all objects inside example_bucket in your s3. By default it lists first 50 items

$ s3patron list example_bucket -a
# passing -a flag will list all items with no limit.

$ s3patron list example_bucket -l 10 #will show first 10 buckets
# You can customize number of results by passing -l flag followed by limit
```

##Upload into a bucket
```shell
#Normal
$ s3patron upload example_bucket example_file.txt
# Will upload example_file.txt to example_bucket

#Optional
# If you do not want to use the AWS REGION defined in env variables you can pass region as next argument
```

##Download object from bucket
```shell
#Normal
$ s3patron download example_bucket example_file.txt
# Will download example_file.txt to current directory

#Optional
# If you do not want to use the AWS REGION defined in env variables you can pass region as next argument
```



##Rubygems.org
Hosted at [Rubygems.org](https://rubygems.org/gems/s3_patron)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
