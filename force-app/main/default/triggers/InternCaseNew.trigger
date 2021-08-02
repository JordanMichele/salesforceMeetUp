trigger InternCaseNew on Account (after insert) {
    for(Account acc : Trigger.new){
        Case ca = new Case();
        ca.OwnerId = '00546000001gqOG';
        ca.Subject = 'Dedupe this account';
        ca.AccountId = acc.Id;
         insert ca;
    
    }
}