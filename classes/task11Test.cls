@isTest
public class task11Test {
	testmethod static void testme(){
        String oldPhone='111';
        Account a1=new Account();
        a1.name='vaibhav';
        a1.phone=oldPhone;
        insert a1;
        Contact c1=new Contact();
        c1.accountId=a1.id;
        c1.lastname='kk';
        insert c1;
        String newPhone='7474';
        try{
            a1.phone=newPhone;
            update a1;
        }catch(Exception e){
            
        }
        Contact c2=[select id,otherphone,Homephone from Contact where id=:c1.id];
        if(oldPhone!=newPhone){
            System.assertEquals(c2.homePhone,newPhone);
            System.assertEquals(c2.otherphone,oldphone);
        }else{
            System.assertEquals(c2.homephone,c1.homephone);
            System.assertEquals(c2.otherphone,c1.otherPhone);
        }
        
    }
}