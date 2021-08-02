trigger AppleWatch on Opportunity (after insert) {
    for(opportunity opp : Trigger.new){
        Task t             = new Task();
        t.Subject          = 'Apple Watch promo';
        t.Description      = 'Send them one ASAP';
        t.Priority         = 'High';
        t.WhatId           = opp.Id;
        insert t;
    }
}