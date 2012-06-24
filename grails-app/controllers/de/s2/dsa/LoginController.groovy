package de.s2.dsa

import s2dsa.Participant

class LoginController {
	
	def login() {
		def participant = Participant.findByUsername(params.username)
		if(participant) {
			flash.message = "Willkommen zurück " + participant.username
		} else {
			participant = new Participant(username: params.username, unlockedPlayerCount: 0, lastUpdate: new Date())
			if (participant.save(insert: true)) {
				flash.message = "Willkommen " + participant.username
			}
		}
		if(participant) {
			session.participant = participant
		} else {
			flash.message = "Hoppla, das hat nicht geklappt"
		}
		redirect(controller: "page", action: "index")
	}
	
	def logout() {
		flash.message = "Du hast dich ausgeloggt"
		session.participant = null
		redirect(controller: "page", action: "index")
	}
}
