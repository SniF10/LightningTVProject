public with sharing class LeftPartController {

	@AuraEnabled
    public static List<JET_BI_Channel_Item__c> getChannelItemsForSection(String section) {
        return FullDisplayController.getChannelItemsForSection(section);
    }

}