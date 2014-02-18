namespace :db do
	desc "Fill m_ordinary_publishers table with sample data"
	task populate: :environment do
		99.times do |n|
			name = Faker::Name.name
			url = "#{name}.com"
			MOrdinaryPublisher.create!(name: name, url: url, state_id: 1, created_user_id: 1, modified_user_id: 1)
		end
	end
end
