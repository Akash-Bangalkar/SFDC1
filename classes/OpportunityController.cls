public with sharing class OpportunityController {
	public static void CreateProjectRecord(List<Opportunity>oppList, Map<Id,Opportunity>oldMap)
    {
        List<Project__c> projRec = New List<Project__c>();
        for(Opportunity opp:oppList)
        {
            if(opp.StageName=='Value Proposition' && opp.StageName != oldMap.get(opp.Id).StageName)
            {
                Project__c proj = New Project__c();
                proj.Name = opp.Name;
                proj.Skills__c = opp.Skills__c;
                proj.Start_Date__c = opp.Start_Date__c;
                proj.Est_End_Date__c = opp.Estimated_End_Date__c;
                proj.Employee_Required__c = opp.No_of_Employee__c;
                proj.Project_Status__c = 'New';
                
                projRec.add(proj);
            }
        }
        
        if(projRec.size()>0)
        {
            Insert projRec;
        }
    }
}