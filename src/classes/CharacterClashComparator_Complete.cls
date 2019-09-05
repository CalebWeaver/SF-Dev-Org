public with sharing class CharacterClashComparator_Complete {

	public Arena_Complete ClashArena {get;set;}
	private Character_Complete character1;
	private Character_Complete character2;

	public CharacterClashComparator_Complete(Arena_Complete arena) {
		ClashArena = arena;
	}

	public String compareCharacters(Character_Complete character1, Character_Complete character2, Integer rounds) {

		this.character1 = character1;
		this.character2 = character2;

		Integer score1 = 0;
		Integer score2 = 0;

		giveArenaBoost();

		for (Integer round = 0; round < rounds; round++) {
			score1 += getCharacterScore(round);
			score2 += getCharacterScore(round);
		}

		if (score1 > score2) {
			return getOutcome(character1, score1, score2);
		} else if (score1 < score2) {
			return getOutcome(character2, score1, score2);
		} else {
			return 'The clash is a draw';
		}
	}

	private void giveArenaBoost() {
		if (ClashArena.ArenaType == 'Ooze'
			&& character1.Science > character2.Science) {
			character1.Science += 2;
		} else if (ClashArena.ArenaType == 'Ooze'
			&& character2.Science > character1.Science) {
			character2.Science += 2;
		}

		if (ClashArena.ArenaType == 'Mana'
			&& character1.Spells > character2.Spells) {
			character1.Spells += 2;
		} else if (ClashArena.ArenaType == 'Mana'
			&& character2.Spells > character1.Spells) {
			character2.Spells += 2;
		}
	}

	private Integer getCharacterScore(Integer round) {
		Integer score = 0;

		if (character1.Strength > character2.Strength) {
			score += round + character1.Strength;
		}

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

	private String getOutcome(Character_Complete winner, Integer score1, Integer score2) {
		return winner.Name + ' is the best character, with the ' + winner.Accessory + ' in the ' + ClashArena.ArenaType
			+ ' arena! The final score was ' + score1 + ' to ' + score2 + '! '
			+ winner.Catchphrase;
	}
}