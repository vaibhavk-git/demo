public class leadStatus 
{
    Public static void RecStatus()
    {
        map<string,map<string,integer>> mapld = new map<string,map<string,integer>>();
        //map<string,integer> mapld1 = new map<string,integer>();
        for(lead objlead :[select id,name,status,leadsource from lead])
        {
            if(mapld.containskey(objlead.status))
            {
                map<string,integer> mapld1 = new map<string,integer>();
                mapld1 = mapld.get(objlead.status);
                if(mapld.containskey(objlead.leadsource))
                {
                    integer intr = mapld1.get(objlead.leadsource);
                    intr = intr+1;
                    mapld1.put(objlead.leadsource,intr);
                } 
                else 
                {
                    mapld1.put(objlead.leadsource,1);
                }
                mapld.put(objlead.status,mapld1);
            } 
            else
            {
                map<string,integer> mapld1 = new map<string,integer>();
                if(mapld.containskey(objlead.leadsource))
                {
                    integer intr = mapld1.get(objlead.leadsource);
                    intr = intr+1;
                    mapld1.put(objlead.leadsource,intr);
                } 
                else 
                {
                    mapld1.put(objlead.leadsource,1);
                }
                mapld.put(objlead.status,mapld1);
                system.debug('hello');
                system.debug('----'+mapld);
                
            }
        }
        system.debug('----'+mapld);
    }
}


/* 
 * |----{Closed - Converted={Phone Inquiry=1, Purchased List=1, Web=1},
 *  Closed - Not Converted={Partner Referral=1, Phone Inquiry=1, Purchased List=1, Web=1}, 
 * Open - Not Contacted={null=1, Phone Inquiry=1, Purchased List=1, Web=1}, 
 * Working - Contacted={Partner Referral=1, Phone Inquiry=1, Purchased List=1, Web=1}}
 * */