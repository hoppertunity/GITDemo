public with sharing class TestClass1 {
  public static void AccountInsert(List<Account> triggerNew)
  {
  		for(Account a:triggerNew)
  		{
  			
  			
  			insert a;
  			system.debug('test:test' + a.id);
  			
  			
  			
  		}
  }
}