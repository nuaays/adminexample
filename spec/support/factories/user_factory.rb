FactoryGirl.define do
	sequence(:email) {|n| "user#{n}@example.com"}
	
	factory :user do
		name "Example1"
		email { generate(:email)}
		password "Example"
		password_confirmation "Example"
	
		factory :admin_user do
			admin true
		end
		
	end
end