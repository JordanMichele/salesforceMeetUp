@isTest
private class AppleWatchTest{
    // Hello from the sfdc dev console
    @isTest static void createOpportunity(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Swift Deal';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
    }    
}