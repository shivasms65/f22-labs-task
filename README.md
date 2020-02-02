Run:

 bundle install && 
 rails db:create &&
 rails db:migrate &&
 rails db:seed &&
 rails s


 Admin User:

 Email: admin@f22.com
 password: password

 Admin Dashboard: https://f22-labs.herokuapp.com

 Generate PDF Result: https://f22-labs.herokuapp.com/admin/user/1
      - In the bottom you can find "Generate PDF Results" - It will help you to download a user's result in PDF
 


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
