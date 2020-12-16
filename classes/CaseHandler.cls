public class CaseHandler {
    public static void ShareCaseRec(list<case> clist){
        List<CaseShare> share=new List<CaseShare>();
        User u=[select id from User where alias='vkhode'];
        for(Case c:clist){
            if(c.origin=='Email' && c.priority=='High'){
                CaseShare cs=new CaseShare();
                cs.caseId=c.id;
                cs.UserOrGroupId=u.id;
                cs.caseAccesslevel='Edit';
                cs.RowCause='Manual';
                share.add(cs);
            }
        }
        insert share;
    }
}