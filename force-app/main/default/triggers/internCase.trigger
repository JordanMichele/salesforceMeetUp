trigger internCase on Account (after insert) {
    for(Account acc : Trigger.new){
        
        Case c = new Case();
        
        c.OwnerId = '00546000001gqOG';
        c.Subject = 'Dedupe this account';
        c.AccountId = acc.Id;
        
        insert c;
    }
}