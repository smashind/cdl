FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "User #{n}" }
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"

		trait :admin do
			admin true
		end
		
		trait :all_packages do
			package "pcca"
		end
	end

	factory :test do
		name "Test name"
		code 1
    to_create {|instance| instance.save(validate: false) }

    after(:create) do |test|
    	FactoryGirl.create_list(:question, 1, test: test)
    end
	end

	factory :question do
		sequence(:text) { |n| "Question #{n}" }
		test

		transient do
    	choices_count 2
    	correct_choices_count 1
    end
    after(:create) do |question, evaluator|
    	FactoryGirl.create_list(:choice, evaluator.choices_count, question: question)
    	FactoryGirl.create_list(:choice, evaluator.correct_choices_count, :is_correct, question: question)
    end
	end

	factory :choice do
		sequence(:answer) { |n| "Answer #{n}" }
		question

		trait :is_correct do
			is_correct true
		end
	end

	factory :attempt do
    user
    score 10
    place 2
    incorrect 2
    test

    trait :completed do
    	completed true
    	place nil
    end
	end

	factory :contact_message do
		name "John"
		email "john@example.com"
		message "Hi, I have a question."
	end
end