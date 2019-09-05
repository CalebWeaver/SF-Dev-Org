public with sharing class ScienceCharacter extends Character {
	@AuraEnabled
	public String Catchphrase {get {
		return 'Meep Morp!';
	}}

	@AuraEnabled
	public String Accessory {get {
		return 'Ray Gun';
	}}
}