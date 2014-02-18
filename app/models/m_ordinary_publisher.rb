class MOrdinaryPublisher < ActiveRecord::Base	
	before_save do
		self.name = name.downcase
		self.url = url.downcase
	end
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	validates :url, presence: true
	
	def self.search(search)
		if search
			find(:all, conditions: ['id = ? OR name LIKE ?',  search.to_i, "%#{search}%"])
		else
			find(:all)
		end
	end

#	def self.update(id, options = {})
#		update(id, { name: options[:name], url: options[:url], 
#					state_id: options[:state_id], user_id: options[:user_id] })
#	end
end
