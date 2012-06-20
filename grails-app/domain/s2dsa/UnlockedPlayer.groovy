package s2dsa

class UnlockedPlayer {

	static belongsTo = [unlockedBy: Participant]
	static hasOne = [player: Player]
	
	Date unlockTime
	
    static constraints = {
		unlockTime blank: false
    }
}
