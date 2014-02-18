class MOrdinaryPublisher < ActiveRecord::Base
	def self.search(search)
		if search
			find(:all, conditions: ['id = ? OR name LIKE ?',  search.to_i, "%#{search}%"])
		else
			find(:all)
		end
	end
end
