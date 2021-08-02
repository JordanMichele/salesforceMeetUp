trigger DedupeLead on Lead (before insert) {
    // Get the data quality queue record ready for future use
		List <Group> dataQualityGroups = [SELECT Id
                                  FROM Group
                                  WHERE DeveloperName = 'Data_Quality'
                                  LIMIT 1];
    for(Lead myLead : Trigger.new){       
        // Prepare bind variable
        String firstNameMatch;
            if(myLead.FirstName != null){
                firstNameMatch = myLead.FirstName.substring(0, 1) +'%';
            }
           String companyMatch = '%' + myLead.Company + '%';
        // Search for matching contacts 
       	List<Contact> matchingContacts = [SELECT Id,
                                          			FirstName,
                                          			LastName,
                                          			Account.Name
                                          		FROM Contact
                                          		WHERE  (Email != null
                                                        AND Email = :myLead.Email)
                                                OR (
                                                FirstName != null
                                                AND FirstName LIKE :firstNameMatch                                        	                                         		                                     		
                                         		AND Lastname = :myLead.Lastname
                                         		AND Account.name LIKE :companyMatch)
                                         		];
        
        System.debug(matchingContacts.size() + ' contact(s) found.');
        
        // if matches are found ...
        if(!matchingContacts.isEmpty()) {
        // assign lead to the data quality queue
            if(!dataQualityGroups.isEmpty()){
                myLead.OwnerId = dataQualityGroups.get(0).Id;
            }
           
            
        // Add the dupe contact IDs into the lead description
        	String dupeContactsMessage = 'Duplicate contacts(s) found:\n';
            for(Contact matchingContact : matchingContacts){
                dupeContactsMessage += matchingContact.FirstName + ''
                    				+  matchingContact.LastName + ','
                    				+  matchingContact.Account.Name + ' ('
                    				+  matchingContact.Id + ')\n';
            }
                if(myLead.Description != null){
                    dupeContactsMessage += '\n' + myLead.Description;
                }
            		myLead.Description = dupeContactsMessage;
        	}
    }
}