require "refile/simple_form"

if Rails.env.production?
  require "refile/s3"

  aws = {
    access_key_id: ENV["ACCESS_KEY_ID"],
    secret_access_key: ENV["SECRET_ACCESS_KEY"],
    region: ENV["REGION"],
    bucket: ENV["BUCKET"]
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
