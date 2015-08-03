require "refile/backend/s3"

aws = {
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
  bucket: ENV["AWS_BUCKET"]
}

Refile.cache = Refile::Backend::S3.new(prefix: 'cache', **aws, max_size: 10.megabytes)
Refile.store = Refile::Backend::S3.new(prefix: 'store', **aws, max_size: 10.megabytes)












