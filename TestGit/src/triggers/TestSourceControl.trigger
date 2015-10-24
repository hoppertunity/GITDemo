trigger TestSourceControl on Account (before insert) 
{
	TestClass1.AccountInsert(trigger.new);

}