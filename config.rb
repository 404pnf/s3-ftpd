require './s3_driver'

missing = %w[PORT USERNAME PASSWORD ACCESS_KEY_ID SECRET_ACCESS_KEY BUCKET].reject { |name| ENV[name] }
raise "missing env variables: #{missing}" unless missing.empty?

driver S3Driver
port ENV['PORT']