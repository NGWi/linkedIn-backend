# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Person.create(first_name: "Mark", last_name: "Boeckenstedt", email: "mark@example.com", phone_number: "555-123-4567", short_bio: "Dedicated software engineering professional, passionate about collaborative test-driven development.", linkedin_url: "https://www.linkedin.com/mark-boeckenstedt", twitter_handle: "@markb", personal_blog_url: "https://www.bock-instead.com", online_resume_url: "https://drive.google.com/file/d/1WISkkOTz47FWbxnq49HXeAF-gUJ_u-l4/view?usp=sharing", github_url: "https://github.com/markboeckenstedt", photo: "https://live.staticflickr.com/65535/52547889251_f0304e18e7_3k.jpg")
