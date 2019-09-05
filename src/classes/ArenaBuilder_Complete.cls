public with sharing class ArenaBuilder_Complete {

	private Arena_Complete clashArena = new Arena_Complete();

	public ArenaBuilder_Complete() {
		this.clashArena.ArenaOccupancy = 2;
		this.clashArena.CrowdSize = 500;
	}

	public ArenaBuilder_Complete setArenaType(String arenaType) {

		if (arenaType == 'Ooze') {
			clashArena.Concessions.add('Pudding');
		} else if (arenaType == 'Mana') {
			clashArena.Concessions.add('Popsicles');
		}
		clashArena.ArenaType = arenaType;

		return this;
	}

	public ArenaBuilder_Complete setArenaSize(String arenaSize) {

		if (arenaSize == 'Small') {
			this.clashArena.ArenaOccupancy = 2;
			this.clashArena.CrowdSize = 100;
		} else if (arenaSize == 'Large') {
			this.clashArena.ArenaOccupancy = 4;
			this.clashArena.CrowdSize = 1000;
		}

		return this;
	}

	public ArenaBuilder_Complete setSpecialConcession(String concession) {
		this.clashArena.Concessions.add(concession);
		return this;
	}

	public Arena_Complete build() {
		return clashArena;
	}
}