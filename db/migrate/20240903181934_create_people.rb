class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :short_bio
      t.string :linkedin_url
      t.string :twitter_handle
      t.string :personal_blog_url
      t.string :online_resume_url
      t.string :github_url
      t.string :photo
      t.string :password_digest

      t.timestamps
    end
  end
end
