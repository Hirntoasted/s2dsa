package s2dsa

class UnlockedPlayer {

	static belongsTo = [unlockedBy: Participant]
	static hasOne = [player: Player]
	
    static constraints = {
    }
}
