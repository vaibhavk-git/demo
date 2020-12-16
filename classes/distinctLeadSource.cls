public class distinctLeadSource 
{
    public static void bySource()
    {
        list<AggregateResult> ldlist = [SELECT LeadSource, COUNT(Name) FROM Lead  GROUP BY LeadSource having COUNT(Name)>10];
        system.debug('list of leadsource'+ldlist);
        
    }
}