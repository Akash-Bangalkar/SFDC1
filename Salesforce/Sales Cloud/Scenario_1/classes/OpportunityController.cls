public with sharing class OpportunityController {
	public static void CreateProjectRecord(List<Opportunity>oppList, Map<Id,Opportunity>oldMap)
    {
        List<Project__c> projRec = New List<Project__c>();
        Set<Id> oppID_w = New Set<Id>();
        Set<Id> oppID_l = New Set<Id>();
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
                proj.Opportunity__c = opp.Id;
                projRec.add(proj);
            }
            else if(opp.StageName=='Closed Won' && opp.StageName != oldMap.get(opp.Id).StageName)
            {
                oppID_w.add(opp.Id);
            }
            else if(opp.StageName=='Closed Lost' && opp.StageName != oldMap.get(opp.Id).StageName)
            {
                oppID_l.add(opp.Id);
            }
        }
        if(projRec.size()>0)
        {
            Insert projRec;
        }
        List<Project__c> proj_W = New List<Project__c>();
        if(oppID_w != NULL)
        {
            for(Project__c proj:[SELECT ID, Project_Status__c FROM Project__c WHERE Opportunity__c IN:oppID_w])
            {
                proj.Project_Status__c = 'Initiated';
                proj_W.add(proj);
            }
        }
        if(proj_W!=NULL)
        {
            Update proj_W;
        }
        
        List<Project__c> proj_L = New List<Project__c>();
        if(oppID_l != NULL)
        {
            for(Project__c proj:[SELECT ID, Project_Status__c FROM Project__c WHERE Opportunity__c IN:oppID_l])
            {
                proj.Project_Status__c = 'Cancelled';
                proj_L.add(proj);
            }
        }
        if(proj_L!=NULL)
        {
            Update proj_L;
        }
    }
}