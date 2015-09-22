FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "User#{n}" }
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"
	end

	factory :test do 
		name "Test 1"
	end

	factory :question do
		text "Question 1"
		test
	end

	factory :choice do 
		answer "Answer 1"
		question 

		trait :correct do
			is_correct true
		end
	end
end