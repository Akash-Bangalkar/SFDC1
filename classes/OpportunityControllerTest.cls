@isTest
private class OpportunityControllerTest {
    @testsetup
	private static void TestData()
    {
        Opportunity opp = New Opportunity();
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today() + 30;
        opp.Name = 'Test Opportunity';
        opp.Start_Date__c = date.today() + 2;
        opp.Estimated_Days__c = 15;
        opp.No_of_Employee__c = 3;
        opp.Skills__c = 'Java;Python';
        Insert opp;
    }
    
    @isTest
    private static void TestMethod1()
    {
        List<Opportunity> oppList = [SELECT ID, StageName FROM Opportunity];
        for(Opportunity opp:oppList)
        {
            opp.StageName = 'Value Proposition';
        }
        
        Test.startTest();
        Update oppList;
        Test.stopTest();
        
        List<Project__c> CheckTest = [SELECT ID FROM Project__c];
        System.assertEquals(1, CheckTest.size());
    }
}