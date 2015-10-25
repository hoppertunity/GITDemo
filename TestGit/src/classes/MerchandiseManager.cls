@RestResource(urlMapping='/Merchandise/*')
global with sharing class MerchandiseManager 
{
	@HttpGet
	global static Merchandise__c getMerchandiseById()
	{
		RestRequest req = RestContext.request;
		String merchId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
		Merchandise__c result = [Select Name, Price__c, quantity__c from Merchandise__c Where Id =:merchId];
		return result;
	}

	@HttpPost
	global static String createMerchandise(String name, Decimal price, Double inventory, String warehouse)
	{
		List<Warehouse__c> warehouses = [Select Id from Warehouse__c Where Name =: warehouse LIMIT 1];
		if(warehouses.size() > 0)
		{
			Merchandise__c m = new Merchandise__c(name = name, Price__c = price, Quantity__c = inventory, Warehouse__c = warehouses[0].id);
			insert m;
			return m.id;
		}
		else
		{
			throw new RESTException('There is no warehouse with the specified name');
			return null;
		}
	}
	
	class RESTException extends Exception{}
	{
	
	}
}