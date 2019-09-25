@isTest
private with sharing class CenterPartControllerTest {
	
	@isTest
    private static void testItems() {

        TestDataFactory.generateJetBiChannelItems(10,true);

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
            AND         Section__c ='Center'
            ORDER BY    Priority__c 
            ASC NULLS FIRST
        ]);
    	
    	System.assertEquals(sectionItemsList, CenterPartController.getChannelItemsForSection('Center'));

    }

}