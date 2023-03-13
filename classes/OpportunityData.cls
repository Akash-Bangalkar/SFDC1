public with sharing class OpportunityData {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> OppData() {
        return [SELECT ID, Name, CloseDate, AccountId, Amount FROM Opportunity];
    }
}