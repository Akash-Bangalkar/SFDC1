trigger OppTrigger on Opportunity (before update) {
	if(trigger.isBefore)
    {
        if(trigger.isUpdate)
        {
            OpportunityController.updateCloseDate(trigger.new, trigger.oldMap);
        }
    }
}