global class UpdateOpportunities {
	public static void AccountActive(List<Account> accList, Map<Id, Account> oldMap)
    {
        List<Account> isActive = New List<Account>();
        for(Account ac:accList)
        {
            if(ac.Active__c=='Yes' && ac.Active__c != oldMap.get(ac.Id).Active__c)
            {
                isActive.add(ac);
            }
        }
        
        List<Opportunity> oppList = New List<Opportunity>();
        if(isActive.size()>0)
        {
            for(Opportunity opp:[SELECT ID, IsPrivate FROM Opportunity WHERE AccountId IN:isActive])
            {
                opp.IsPrivate = True;
                
                oppList.add(opp);
            }
        }
        
        if(oppList != null)
        {
            Update oppList;
        }
    }
}