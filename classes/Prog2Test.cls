@isTest
private class Prog2Test {
    @isTest
    static void testme(){
        Contact c1=new Contact(lastname='khode',leadSource='web');
        Contact c2=new Contact(lastname='kk');
        List<Contact> cons=new List<Contact>{c1,c2};
        Integer count=[select count() from Contact];
        try{
           Database.insert(cons,false);
        }catch(Exception e){
            System.debug(e);
        }
        Integer size=[select count() from contact ];
        System.assertEquals(count+1,size);
    }
}