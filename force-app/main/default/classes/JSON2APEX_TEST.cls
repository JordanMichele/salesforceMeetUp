@isTest
public class JSON2APEX_TEST {
    static testMethod void testParse() {
        String json = '{'+
        '\"response\": {'+
        '    \"count\": 1,'+
        '    \"benchmark\": 0.22567009925842,'+
        '    \"requests\": ['+
        '        {'+
        '            \"request\": {'+
        '                \"id\": 537481,'+
        '                \"image_thumbnail\": \"\",'+
        '                \"title\": \"Request for new bin(s) - residential\",'+
        '                \"description\": \"Propmain ref  3234-1114\",'+
        '                \"status\": \"submitted\",'+
        '                \"address\": \"36 Pine Tree Close\",'+
        '                \"location\": \"Peterborough, England\",'+
        '                \"zipcode\": \"PE1 1EJ\",'+
        '                \"user\": \"\",'+
        '                \"date_created\": 1417173208,'+
        '                \"count_comments\": 0,'+
        '                \"count_followers\": 0,'+
        '                \"count_supporters\": 0,'+
        '                \"lat\": 52.599967,'+
        '                \"lon\": -0.233482,'+
        '                \"user_follows\": 0,'+
        '                \"user_comments\": 0,'+
        '                \"user_request\": 1,'+
        '                \"rank\": \"0\"'+
        '            }'+
        '        }'+
        '    ],'+
        '    \"status\": {'+
        '        \"type\": \"success\",'+
        '        \"message\": \"Success\",'+
        '        \"code\": 200,'+
        '        \"code_message\": \"Ok\"'+
        '    }'+
        '}'+
        '}';
        Test.startTest();
        JSON2APEX obj = JSON2APEX.parse(json);
        System.assert(obj != null);
        system.debug('OBJ '+obj);
        Test.stopTest();
    }

}