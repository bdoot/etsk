source "https://rubygems.org"
ruby "2.1.0"
gem "sinatra", "~> 1.4.4"
gem "haml",  "~> 4.0.5"
gem "redis", "~> 3.0.7"
gem "data_mapper"

group :production do
    gem "pg"
    gem "dm-postgres-adapter"
end

group :development, :test do
    gem "sqlite3"
    gem "dm-sqlite-adapter"
end

