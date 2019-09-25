public with sharing class FullDisplayController {

	@AuraEnabled
    public static Map<String, List<JET_BI_Channel_Item__c>> getItemsChannelData(){
    	Map<String, List<JET_BI_Channel_Item__c>> channelItemsMap = new Map<String, List<JET_BI_Channel_Item__c>>();
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
    		List<JET_BI_Channel_Item__c> channelItemsList = channelItemsMap.get(channelItem.Section__c);
    		if(channelItemsList == null) {
    			channelItemsList = new List<JET_BI_Channel_Item__c>();
    		}
    		channelItemsList.add(channelItem);
    		channelItemsMap.put(channelItem.Section__c, channelItemsList);
    	}
        return channelItemsMap; 
    }

    public static List<JET_BI_Channel_Item__c> getChannelItemsForSection(String section) {
        return [
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
        ];
    }

}