public class customerHandler {
    public static void CustShareRead(List<Customer__c> clist){
        List<Customer__share> share=new List<Customer__share>();
        User u=[select id from user where username='vaibhav.khodeu2@proseraa.com'];
        
        for(Customer__c c:clist){
            
            if(c.status__c=='Accepted'){
                
                Customer__share cs=new Customer__share();
                cs.parentId=c.id;
                cs.userOrGroupId=u.id;
                cs.Accesslevel='Read';
                cs.RowCause=Schema.Customer__share.RowCause.Manual;
                share.add(cs);
                
            }
        }
        
        insert share;
        
    }
}