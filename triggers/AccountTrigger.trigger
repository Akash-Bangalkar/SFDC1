trigger AccountTrigger on Account (after update) {
	if(trigger.isAfter)
    {
        if(trigger.isUpdate)
        {
            UpdateOpportunities.AccountActive(trigger.new, trigger.oldMap);
        }
    }
}