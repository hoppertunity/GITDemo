public with sharing class TestClass1 {
  public static void AccountInsert(List<Account> triggerNew)
  {
  		for(Account a:triggerNew)
  		{
  			
  			a.fet = 'sdf';
  			insert a;
  			
  		}
  }
}