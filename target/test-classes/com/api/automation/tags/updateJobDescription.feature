Feature: To test the patch end point for updating the job description
	PATCH /normal/webapi/update/details
	
	Background: Create and Initialize base Url
		Given url 'http://localhost:9897'
	
@Smoke @Regression		
	Scenario: To update the job description for newly added job entry
		# Create a new Job Entry
		# Using the patch request update the job description of newly added job entry
		* def getRandomValue = function() {return Math.floor((100) * Math.random());}
		* def createJobId = getRandomValue() 
		* def creatJob = call read("../createJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
		#Patch request
		* def jobDes = 'To develop andriod application and web application'
		Given path '/normal/webapi/update/details'
		And params {id:'#(createJobId)',jobTitle:'Software Engg - 2',jobDescription:'#(jobDes)'}
		And header Accept = 'application/json'
		And request {}
		When method patch
		Then status 200
		And match response.jobDescription == jobDes