trigger TriggerAccount on Account (before insert, after insert, before update, before delete)
{
	if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
            accountHandler.updatephone(trigger.new);
            accountHandler.OwnerUPIndustry(trigger.new);
            accountHandler.UpdateAnnualRev(trigger.new);
            accountHandler.updateOwner(trigger.new);
        }
        if(trigger.isupdate)
        {
            accountHandler.updateHomePhone(trigger.oldMap, trigger.newMap);
            accountHandler.TeamInsertBanking(trigger.new);
        }
        if(trigger.isdelete)
        {
            accountHandler.DeleteError(trigger.old);
        }
    }
    if(trigger.isafter)
    {
        if(trigger.isinsert) 
        {
            accountHandler.insertopp(trigger.new);
            accountHandler.AccountTeamInsert(trigger.new);
            accountHandler.insertCon(trigger.new);
        }
        if(trigger.isupdate)
        {
            
        }
    }
}