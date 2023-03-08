trigger OppTrigger on Opportunity (after update) {
	if(trigger.isAfter)
    {
        if(trigger.isUpdate)
        {
            OpportunityController.CreateProjectRecord(trigger.new, trigger.oldMap);
        }
    }
}