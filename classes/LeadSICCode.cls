public with sharing class LeadSICCode {
	public static void SICCodeUpdate(List<Lead>leadList, Map<Id,Lead>oldMap)
    {
        for(Lead ld:leadList)
        {
            if(ld.Primary__c=='Yes' && ld.Primary__c != oldMap.get(ld.Id).Primary__c)
            {
                ld.SICCode__c = 'FD-65.01.45.5';
            }
        }
    }
}