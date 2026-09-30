package com.api.automation.deleterequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestDeleteRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("deleteJobRequest").relativeTo(getClass());
	}
}
