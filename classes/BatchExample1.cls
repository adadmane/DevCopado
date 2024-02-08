global class BatchExample1 implements Database.Batchable<sObject>{
	global Database.QueryLocator start(Database.BatchableContext BC){
		String query='Select Id, Name, Description from Account limit 5';
		return Database.getQueryLocator(query);
	}
	global void execute(Database.BatchableContext BC, List<Account> accList){
		for(Account acc:accList){
			acc.Description='Batchable class description';
		}
		try{
			update accList;
		}catch(Exception e){
			System.debug(e);
		}
	}
	global void finish(Database.BatchableContext BC){

	}
}