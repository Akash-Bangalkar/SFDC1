@isTest
private class UpdateOpportunitiesTest {
    @testSetup
    private static void TestData()
    {
        Account acc = New Account();
        acc.Name = 'Test Account';
        
        Insert acc;
        
        Opportunity opp = New Opportunity();
        opp.Name = 'Testing Opp';
        opp.CloseDate = date.today() + 30;
        opp.StageName = 'Prospecting';
        opp.AccountId = acc.Id;
        
        Insert opp;
    }
    @isTest
    private static void TestMethod1()
    {
        List<Account> acc = [SELECT Id, Active__c FROM Account];
        
        for(Account ac:acc)
        {
            ac.Active__c = 'Yes';
        }
        
        Test.startTest();
        Update acc;
        Test.stopTest();
    }
}