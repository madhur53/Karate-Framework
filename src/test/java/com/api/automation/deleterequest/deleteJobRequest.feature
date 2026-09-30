Feature: To test the delete end point 
	DELETE /normal/webapi/remove/{id}
	
	Background: Create and Initialize base Url
		Given url 'http://localhost:9897'
		
	Scenario: To delete the job entry
		# Create a new Job Entry
		# Using the delete request delete the newly added job entry
		# Get request with query parameter and validate for 404
		* def getRandomValue = function() {return Math.floor((100) * Math.random());}
		* def createJobId = getRandomValue() 
		* def creatJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
		#DELETE request 
		Given path '/normal/webapi/remove/' + createJobId
		#And params {id:'#(createJobId)'}
		And headers {Accept:'application/json'}
		When method delete
		Then status 200
		# Get Request
		Given path '/normal/webapi/find'
		And params {id:'#(createJobId)',jobTitle:'Software Engg - 2'}
		And header Accept = 'application/json'
		When method get
		Then status 404
		
	Scenario: To demo request chaining
	# Create a new job entry
	# Extract the job id and job title from the response of POST request
	# Send the path request, Value of query parameter will be set by, info extracted from previous request
	# Extract the job id and job title from the response of patch request
	# Get request with query parameter, value of query param is set by info extracted from response of patch request
	# Add the validation on job description in the response of get request
	* def getRandomValue = function() {return Math.floor((100) * Math.random());}
	* def createJobId = getRandomValue()
	* def createJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
	* def jobId = createJob.responseJobId
	* def jobTitle = createJob.responseJobTitle
	
	# Patch request
	* def jobDes = 'To develop andriod application and web application'
	Given path '/normal/webapi/update/details'
	And params {id:'#(jobId)',jobTitle:'#(jobTitle)',jobDescription:'#(jobDes)'}
	And header Accept = 'application/json'
	And request {}
	When method patch
	Then status 200
	* def jobId = response.jobId
	* def jobTitle = response.jobTitle
	
	#Get Request
	Given path '/normal/webapi/find'
	And params {id:'#(jobId)',jobTitle:'#(jobTitle)'}
	And header Accept = 'application/json' 
	When method get
	Then status 200
	And match response.jobDescription == jobDes