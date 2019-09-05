public with sharing class CharacterFactory {

	public Character getCharacter(Integer science, Integer spells) {
		Character character;
		if (science >= spells) {
			character = new ScienceCharacter();
		} else {
			character = new SpellsCharacter();
		}
		return character;
	}
}