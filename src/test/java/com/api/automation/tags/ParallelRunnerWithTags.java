package com.api.automation.tags;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;

public class ParallelRunnerWithTags {
	
		private static final String CLASS_PATH = "classpath:";
		private static final String DELIMITER = ",";

		@Test
		public void executeKarateTests() {
			Builder aRunner = new Builder();
			aRunner.path(getLocation());
			aRunner.tags(getTags());
			aRunner.parallel(5);
			//aRunner.tags("@Smoke","@Regression");
			//Runner.parallel(aRunner);
		}
		
		//step 1 - Provide the values for location and tags property. All the values will be separate by ","
		// Read the values, split them using the "," and create a list out of it.
		
		/*private List<String> getTags(){
			String aTags = System.getProperty("tags", "@Confidence");
			List<String> aTagList = Arrays.asList(aTags);
			return aTagList;
		}
		
		private List<String> getLocation(){
			String aLocation = System.getProperty("location", "com/api/automation");
			List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
			return aLocationList;
		}*/
		
		private List<String> getTags(){
			String aTags = System.getProperty("tags", "@Confidence");
			List<String> aTagList = Collections.emptyList();
			if(aTags.contains(DELIMITER)) {
				String tagArray[] = aTags.split(DELIMITER);
				aTagList = Arrays.asList(tagArray);
				return aTagList;
			}
			
			aTagList = Arrays.asList(aTags);
			return aTagList;
		}
		
		private List<String> getLocation(){
			String aLocation = System.getProperty("location","com/api/automation");
			List<String> aLocationList = Collections.emptyList();
			if(aLocation.contains(DELIMITER)) {
				String locationArray[] = aLocation.split(DELIMITER);
				aLocationList = Arrays.asList(locationArray);
				aLocationList.replaceAll((entry) -> {
					return CLASS_PATH + entry;
				});
				return aLocationList;
			}
			aLocationList = Arrays.asList(CLASS_PATH + aLocation);
			return aLocationList;
		}
}
