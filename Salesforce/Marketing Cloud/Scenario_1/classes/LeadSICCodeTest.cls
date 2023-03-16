@isTest
private class LeadSICCodeTest {
    @testsetup
	private static void TestData()
    {
        List<Lead> leadList = New List<Lead>();
        Lead ld = new Lead();
        ld.FirstName = 'Akash';
        ld.LastName = 'Bangalkar';
        ld.Status = 'New';
        ld.Company = 'FlexaNet';
        ld.Budget__c = 'Greater Than ₹5,00,000';
        
        leadList.add(ld);
        
        Insert leadList;
    }
    
    @isTest
    private static void testMethod1()
    {
        List<Lead> ldList = [SELECT ID, Primary__c FROM Lead];
        
        for(Lead ld:ldList)
        {
            ld.Primary__c = 'Yes';
        }
        
        Test.startTest();
        Update ldList;
        Test.stopTest();
        
        List<Lead> ldCheck = [SELECT ID, SICCode__c FROM Lead WHERE SICCode__c!=NULL];
        System.assertEquals(1, ldCheck.size());
    }
}