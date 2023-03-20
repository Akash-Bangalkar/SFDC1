public with sharing class LeadSICCode {
	public static void SICCodeUpdate(List<Lead>leadList, Map<Id,Lead>oldMap)
    {
        Set<ID> leadId = New Set<ID>();
        for(Lead ld:leadList)
        {
            if(ld.Primary__c=='Yes' && ld.Primary__c != oldMap.get(ld.Id).Primary__c)
            {
                ld.SICCode__c = 'FD-65.01.45.5';
                leadId.add(ld.Id);
            }
        }
        List<Asset__c> asetUpdate = New List<Asset__c>();
        if(leadId.size()>0)
        {
            for(Asset__c asset:[SELECT ID, Asset_Available__c FROM Asset__c WHERE Lead__c IN: leadId])
            {
                asset.Asset_Available__c = true;
                asetUpdate.add(asset);
            }
        }
        if(asetUpdate!=NULL)
        {
            Update asetUpdate;
        }
    }
}