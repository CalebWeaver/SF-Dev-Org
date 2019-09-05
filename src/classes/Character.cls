public virtual with sharing class Character {
	@AuraEnabled
	public String Name {get;set;}
	@AuraEnabled
	public Integer Strength {get;set;}
	@AuraEnabled
	public Integer Stamina {get;set;}
	@AuraEnabled
	public Integer Science {get;set;}
	@AuraEnabled
	public Integer Spells {get;set;}
	@AuraEnabled
	public String Accessory {get;set;}
	@AuraEnabled
	public String Catchphrase {get;set;}

	public Character() {
		Strength = 0;
		Stamina = 0;
		Science = 0;
		Spells = 0;
	}
}