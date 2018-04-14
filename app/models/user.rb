class User < ApplicationRecord
	has_secure_password

	enum role: {
		supplier: 'Supplier',
		customer: 'Customer'
	}

	enum gender: {
		male: 'Male',
		female: 'Female'
	}

	belongs_to :village
	has_many :products
	has_many :product_barters
end