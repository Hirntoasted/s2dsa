modules = {
    application {
		dependsOn 'jquery'
		
        resource url:'js/application.js'
		resource url:'css/main.less', attrs:[rel: "stylesheet/less", type:'css']
    }
}