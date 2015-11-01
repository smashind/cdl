FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "User #{n}" }
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"
	end

	factory :test do 
		name "Test 1"
	end

	factory :question do
		sequence(:text) { |n| "Question #{n}" }
		test
	end

	factory :choice do 
		sequence(:answer) { |n| "Answer #{n}" }
		question  

		trait :correct do
			is_correct true
		end
	end

	factory :attempt do
    
	end
end