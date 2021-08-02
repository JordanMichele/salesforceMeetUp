public with sharing class Human {
    private String name;
    private Integer siblings;
    private String cityBorn;
    private String hairColor;
    private String gender;
    
    public Human(String name, Integer siblings, String cityBorn, String hairColor, String gender) {
        this.name = name;
        this.siblings = siblings;
        this.cityBorn = cityBorn;
        this.hairColor = hairColor;
        this.gender = gender;
    }

    public void greet(){
         System.debug('name is ' + name 
                      + ' I have ' + siblings + ' siblings! I was born in the city of ' 
                      + cityBorn + ' and I have ' 
                      + haircolor + ' color hair!!' );
    }
}