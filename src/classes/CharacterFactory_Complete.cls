public with sharing class CharacterFactory_Complete {
	public Character_Complete getCharacter(String characterType) {
		Character_Complete character;
		if (characterType == 'Science') {
			character = new ScienceCharacter_Complete();
		} else if (characterType == 'Spells') {
			character = new SpellsCharacter_Complete();
		}
		return character;
	}
}