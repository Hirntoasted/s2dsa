import grails.util.GrailsUtil;
import s2dsa.Player;

class BootStrap {

    def init = { servletContext ->
		switch(GrailsUtil.environment){
			case "development":
				def framus = new Player(name: "Franz Mustermann", about: "Bla", department: "Development", secret: "hallo123", s2name: "framus")
				framus.save()
				def karmus = new Player(name: "Karl Mustermann", about: "Blubb", department: "Development", secret: "hallo456", s2name: "karmus")
				karmus.save()
				def maxmus = new Player(name: "Max Mustermann", about: "Blubberererer", department: "Development", secret: "hallo789", s2name: "maxmus")
				maxmus.save()
			break
			case "production":
			break
		}
    }
    def destroy = {
    }
}
