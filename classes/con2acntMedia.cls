public class con2acntMedia 
{
	public static void mediaIndus()
    {
        list<contact> cslist = [select id, name, Department from contact where account.industry = 'media'];
        system.debug('list of contacts having media industry'+cslist);
    }
}