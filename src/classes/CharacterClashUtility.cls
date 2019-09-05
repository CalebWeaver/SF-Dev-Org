public with sharing class CharacterClashUtility {

	public Arena clashArena = new Arena();

	public CharacterClashUtility(Arena clashArena) {
		this.clashArena = clashArena;
	}

	public String compareCharacters(Character character1, Character character2, Integer rounds) {

		Integer score1 = 0;
		Integer score2 = 0;

		getArenaBonus(character1, character2);
		getArenaBonus(character2, character1);

		for (Integer round = 0; round < rounds; round++) {
			score1 += getScore(character1, character2, round);
			score2 += getScore(character2, character1, round);
		}

		if (score1 > score2) {
			return character1.Name + ' is the best character, with the ' + character1.Accessory + ' in the ' + clashArena.ArenaType
				+ ' arena! The final score was ' + score1 + ' to ' + score2 + '! '
				+ character1.Catchphrase;
		} else if (score2 > score1) {
			return character2.Name + ' is the best character, with the ' + character2.Accessory + ' in the ' + clashArena.ArenaType
				+ ' arena! The final score was ' + score1 + ' to ' + score2 + '! '
				+ character2.Catchphrase;
		} else {
			return 'The clash is a draw';
		}
	}

	private void getArenaBonus(Character character1, Character character2) {
		if (clashArena.ArenaType == 'Ooze'
			&& character1.Science > character2.Science) {
			character1.Science += 2;
		}
		if (clashArena.ArenaType == 'Mana'
			&& character1.Spells > character2.Spells) {
			character1.Spells += 2;
		}
	}

	private Integer getScore(Character character1, Character character2, Integer round) {

		Integer score = 0;

		score += getAddScore(character1.Strength, character2.Strength, round);

		if (character1.Stamina > character2.Stamina) {
			score += round + character1.Stamina;
		}

		if (character1.Spells > character2.Spells) {
			score += round * character1.Spells;
		}

		if (character1.Science > character2.Science) {
			score += round * character1.Science;
		}

		return score;
	}

	private Integer getAddScore(Integer attribute1, Integer attribute2, Integer round) {
		if (attribute1 > attribute2) {
			return round + attribute1;
		}
		return 0;
	}
}