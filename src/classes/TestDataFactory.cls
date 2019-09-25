@isTest
public with sharing class TestDataFactory {

    public static List<JET_BI_Channel_Item__c> generateJetBiChannelItems(Integer scopeSize, Boolean isInsert) {
        List<JET_BI_Channel_Item__c> testItems = new List<JET_BI_Channel_Item__c>();
        for (Integer i=0; i<scopeSize; i++) {
            testItems.add(
            	new JET_BI_Channel_Item__c(
            		Name  ='testitem '+ i,
            		Start_Date_TIme__c=Datetime.newInstance(2019, 2, 15, 8, 30, 12),
            		End_Date_Time__c=Datetime.newInstance(2019, 2, 25, 8, 30, 12),
            		Is_Active__c = TRUE,
            		Priority__c = 3,
            		Content_Type__c = 'Video',
            		Section__c = 'Center',
            		Message__c='1234',
            		URL__c='1234'
            	)
            );
        }
        if(isInsert) {
        	insert testItems;
        }
        return testItems;        
    }

}