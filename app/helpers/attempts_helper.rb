module AttemptsHelper
	def active_attempts(user, test)
  	user.attempts.where(test_id: test.id).where(completed: nil)
  end

  def last_attempt(user, test)
  	active_attempts(user, test).last
  end

  def last_attempt_in_progress(user, test)
  	if user.attempts.where(test_id: test.id).last.completed == nil
  		true
  	end
  end

  def remaining_questions(total, correct, incorrect)
  	total - (correct + incorrect)
  end
end
