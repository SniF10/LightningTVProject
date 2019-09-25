public with sharing class CenterPartController {

	@AuraEnabled
    public static List<JET_BI_Channel_Item__c> getChannelItemsForSection(String section) {
        return FullDisplayController.getChannelItemsForSection(section);
    }
    
}