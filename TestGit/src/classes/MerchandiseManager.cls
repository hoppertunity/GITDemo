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

}