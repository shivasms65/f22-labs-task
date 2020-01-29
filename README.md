# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



Run:

 bundle install && 
 rails db:create &&
 rails db:seed &&
 rails s
 
 - Start the server and check the Below API's


API Info:-

Post: https://f22-labs.herokuapp.com/api/v1/questions/:question_id/answers
	Answer a question	

	 option_id: 
	   selected option for questions
	   send option_id as nil if user select skip the question

	 user_id: User who is answering question


 GET: https://f22-labs.herokuapp.com/api/v1/users/:user_id/:branch_type/:branch_id/questions
 	Get User Questions By Exam, Subject, Topics or Chapter

	 user_id: User who is requesting questions
	 branch_type: only accept - ["exams", "subjects", "topics", "chapters"]
	 branch_id: Valid Id of Branch


 GET: https://f22-labs.herokuapp.com/api/v1/users/:user_id/:branch_type/:branch_id/results
 	Get User Results By Exam, Subject, Topics or Chapter

	 user_id: User who's result is requesting
	 branch_type: only accept - ["exams", "subjects", "topics", "chapters"]
	 branch_id: Valid Id of Branch

 GET: https://f22-labs.herokuapp.com/api/v1/users/:user_id/results
	Get User Overall Results

	user_id: User who's result is requesting
