class User < ActiveRecord::Base
	validates :name, presence:true, uniqueness:true
	has_secure_password
	after_destroy :ensure_an_admin_remains

	private
	# Make sure we have at least one admin user remains in database
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
end
