trigger ContactBeforeDelete on Contact (Before Delete ) {
    for(Contact c:Trigger.old)
    {
    if(c.accountId==null)
        {
        c.addError('Hey!! You are not authorized to delete this account');
        }
     }
}