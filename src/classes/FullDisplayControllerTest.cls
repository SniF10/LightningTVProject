@isTest
private with sharing class FullDisplayControllerTest {

    @isTest
    private static void testItems() {

        TestDataFactory.generateJetBiChannelItems(10, true);

    	String section = 'Center';

    	Map<String, List<JET_BI_Channel_Item__c>> channelItemsMapTest = new Map<String, List<JET_BI_Channel_Item__c>>();
    	for(JET_BI_Channel_Item__c channelItem : [
            SELECT      Duration_Seconds__c,
                        Id,
                        Message__c,
                        URL__c,
                        Section__c,
                        Content_Type__c
	      	FROM        JET_BI_Channel_Item__c 
	      	WHERE       (Start_Date_TIme__c <= TODAY AND End_Date_Time__c >= TODAY) 
            AND         Is_Active__c = TRUE 
	      	ORDER BY    Priority__c 
            ASC NULLS FIRST
    	]) {
    		List<JET_BI_Channel_Item__c> channelItemsList = channelItemsMapTest.get(channelItem.Section__c);
    		if(channelItemsList == null) {
    			channelItemsList = new List<JET_BI_Channel_Item__c>();
    		}
    		channelItemsList.add(channelItem);
    		channelItemsMapTest.put(channelItem.Section__c, channelItemsList);
    	}

    	List<JET_BI_Channel_Item__c> sectionItemsList = new List<JET_BI_Channel_Item__c>(
    		[
            SELECT      Duration_Seconds__c,
                        Id,
                        Message__c,
                        URL__c,
                        Section__c,
                        Content_Type__c
            FROM        JET_BI_Channel_Item__c 
            WHERE       (Start_Date_TIme__c <= TODAY AND End_Date_Time__c >= TODAY) 
            AND         Is_Active__c = TRUE 
            AND         Section__c = :section
            ORDER BY    Priority__c 
            ASC NULLS FIRST
        ]);

    	System.assertEquals(channelItemsMapTest, FullDisplayController.getItemsChannelData());
    	System.assertEquals(sectionItemsList, FullDisplayController.getChannelItemsForSection('Center'));
        
    }

}