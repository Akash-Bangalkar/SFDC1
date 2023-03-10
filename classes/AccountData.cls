public with sharing class AccountData {
    @AuraEnabled(cacheable=true)
    public static List<Account> AccList()
    {
        return [SELECT ID, Name, Rating, Code__c FROM Account];
    }
}