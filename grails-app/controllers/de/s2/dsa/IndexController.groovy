package de.s2.dsa

import s2dsa.Player;
import s2dsa.Participant
import s2dsa.UnlockedPlayer;

class IndexController {

    def index() {
		def players = Player.findAll()
		def participant
		if (session.participant) {
			participant = Participant.get(session.participant.id)
		}
		[players: players, participant: participant]
	}
	
	def unlock() {
		if (session.participant) {
			def player = Player.findBySecret(params.secret);
			def part = Participant.get(session.participant.id)
			if (player) {
				def res = part
					.addToUnlockedPlayers(new UnlockedPlayer(unlockedBy: session.participant, player: player, unlockTime: new Date()))
					.save()
				if (res) {
					flash.message = "Spieler erfolgreich freigeschaltet"
				} else {
					flash.message = session.participant.errors
				}
			} else {
				flash.message = "Kein Spieler mit diesem Codewort gefunden"
			}
		} else {
		flash.message = "Melden Sie sich erstmal an..."
		}
		redirect(action: "index")
	}
	
	def register() {
		def participant = new Participant(username: params.username, password: params.password)
		if (participant.save(insert: true)) {
			flash.message = "Sie haben sich erfolgreich registriert und können sich nun anmelden"
		} else {
			flash.message = participant.errors
		}
		redirect(action: "index")
	}
	
	def authenticate() {
		def participant = Participant.findByUsernameAndPassword(params.username, params.password)
		if(participant) {
			session.participant = participant
		} else {
			flash.message = "Sorry, Username / Password sind uns nicht bekannt"
		}
		redirect(action: "index")
	}
	
	def logout() {
		flash.message = "Sie haben sich ausgeloggt"
		session.participant = null
		redirect(action: "index")
	}
}
