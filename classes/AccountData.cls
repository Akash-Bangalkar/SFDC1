public with sharing class AccountData {
    @AuraEnabled(cacheable=true)
    public static List<Account> AccList()
    {
        //returns the account data
        return [SELECT ID, Name, Rating, Code__c, Site, Type FROM Account];
    }
}