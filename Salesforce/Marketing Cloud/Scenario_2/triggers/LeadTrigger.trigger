trigger LeadTrigger on Lead (before update) {
	if(trigger.isBefore)
    {
        if(trigger.isUpdate)
        {
            LeadSICCode.SICCodeUpdate(trigger.new, trigger.oldMap);
        }
    }
}