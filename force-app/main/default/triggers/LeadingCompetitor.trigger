trigger LeadingCompetitor on Opportunity (before insert, before update) {
    for (Opportunity opp : Trigger.new){
     // Create an empty List of type Decimal
     // Grab all the Competitor prices fields 
     // add those fields into the list 
      List<Decimal> competitorPrices = new List<Decimal>();
      competitorPrices.add(opp.Competitor_1_Price__c);
      competitorPrices.add(opp.Competitor_2_Price__c);
      competitorPrices.add(opp.Competitor_3_Price__c);
     
     // Create a List of type String 
     // Grab and add the Competitor names into the list
      List<String> competitors = new List<String>();
      competitors.add(opp.Competitor_1__c);
      competitors.add(opp.Competitor_2__c);
      competitors.add(opp.Competitor_3__c);
        
        Decimal lowestPrice;
        Integer lowestPricePosition;
        Decimal highestPrice;
        Integer highestPricePosition;
        for(Integer i = 0; i < competitorPrices.size(); i++){
            if(lowestPrice == null || competitorPrices.get(i) < lowestPrice){
                lowestPrice = competitorPrices.get(i);
                lowestPricePosition = i;
            }
            if(highestPrice == null || competitorPrices.get(i) > highestPrice){
                highestPrice = competitorPrices.get(i);
                highestPricePosition = i;
            }
        }
        opp.Leading_Competitor__c = competitors.get(lowestPricePosition);            
        opp.Most_Expensive__c = competitors.get(highestPricePosition);
       
    }
}