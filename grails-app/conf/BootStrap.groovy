import org.andrill.adb.*

class BootStrap {
	def springSecurityService
	
    def init = { servletContext ->
		// get/create our main roles
		def userRole  = Role.findByAuthority('ROLE_USER')  ?: new Role(authority: 'ROLE_USER').save(failOnError: true, flush: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true, flush: true)
		
		// create our admin user if it does not already exist
		def adminUser = User.findByUsername('admin') ?: new User(
				username: 'admin',
				password: springSecurityService.encodePassword('changeme'),
				enabled: true,
				firstName: 'ADB',
				lastName: 'Admin',
				email: 'info@andrill.org'
			).save(failOnError: true, flush: true)
			
		if (!adminUser.authorities.contains(adminRole)) {
			UserRole.create adminUser, adminRole, true
		}
    }
    def destroy = {
    }
}
